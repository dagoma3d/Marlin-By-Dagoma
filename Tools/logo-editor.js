if (!String.prototype.trim) {
	String.prototype.trim = function () {
		return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
	};
}

jQuery(function($) {

	var toByteStr = function(v) {
		var s = v.toString(16);
		if (v < 16) {
			s = "0"+s;
		}
		return "0x" + s.toUpperCase();
	}

	var updateCCode = function() {
		var lines = [];
		$('#logo tr').each( function(i, tr) {
			var line = [];
			$(tr).find('td').each( function(j, td) {
				var lineIdx = Math.floor(j / 8);
				var bitIdx = j % 8;
				line[lineIdx] = line[lineIdx] || 0x00;
				if ( $(this).hasClass('enable') ) {
					line[lineIdx] = line[lineIdx] | ( 0x80 >> bitIdx );
				}
			});
			var e,n=line.length;
			for(e=0; e<n; e++) {
				line[e] = toByteStr( line[e] );
			}
			lines.push(line.join(', '))
		});
		$('#c-code').val( lines.join( ", \n" ) );
	};

	var generateGrid = function(e) {
		var cCode = $(this).val();
		var cCodeLines = cCode.split('\n');

		var i,n=cCodeLines.length;

		var jTable = $("<table id='logo'/>");
		var maxPartWidth;

		for(i=0; i<n; i++) {
			var line = cCodeLines[i].trim();
			if ( !line.startsWith( '0x' ) ) continue;
			var jRow = $("<tr/>");

			var pixParts = line.split(',');

			var j,m = pixParts.length;
			for(j=0; j<m; j++) {
				var pixPart = pixParts[j].trim();
				if ( !pixPart.startsWith( '0x' ) ) continue;
				maxPartWidth = (maxPartWidth || 0)+1;
				var pixPartValue = parseInt( pixPart );
				var b;
				var current = 0x80;
				for( b=0; b<8; b++ ) {
					var jTd = $("<td/>");
					/*
					jTd.click( function(e) {
						$(this).toggleClass( 'enable' );
						updateCCode();
					} );
					*/
					jTd.on('mousedown mouseover', function(e) {
						if (e.buttons != 1) return;
						if ( 'drawState' in window ) {
							if ( window.drawState ) {
								$(this).addClass( 'enable' );
							}
							else {
								$(this).removeClass( 'enable' );
							}
						} else {
							$(this).toggleClass( 'enable' );
							window.drawState = $(this).hasClass( 'enable' );
						}
					} );
					
					jTd.on('mouseup', function(e) {
						console.log("up");
						delete window.drawState;
						updateCCode();
					});

					if ( current & pixPartValue ) {
						jTd.addClass( 'enable' );
					}
					
					jRow.append(jTd);
					current = current >> 1;
				}
			}

			jTable.append( jRow );
		}
		$('#right').empty();
		$('#right').append( jTable );
	};

	$('#c-code').change(generateGrid);
	$('#c-code').keyup(generateGrid);

});