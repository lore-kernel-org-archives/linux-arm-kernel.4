Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5OuzfJB;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=eNsQ+uEj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5r4t6QrAUP1J3ygaG1uqm3B+iaB0VTP6veZu1UrZo0o=; b=k5OuzfJB/uF5Vvtm7hV8LuJsev
	yGk5gUaht3iSvcaMpWt0dPeLdp9NpfCfvranA5uK4jr8T6FmQWOp51nQTV3F3mstNusTOfaziF80A
	MIFRG5867RLINo3L4nUtW01GTlVoVvmeJTobGfTXOiwdhpDeO5JI7tW6x1JW+0glqjVtIYVNW5xX8
	MoFrDZHCM4+a6HBkB5hQwos+6GbFb9FHdQ0PP9DDQAA5Ra30e9DzHgO+wxB2w9/aXjQ/s1oT5H8n4
	M9WeXmJrNiY74ZMup7676pViHSvZAfQ9Ly3kCkrw9MTyWVENIOs4LDFZXf4RTypMFyBxvVtY1wRYI
	Ok0RpTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnIL-00000004ICy-3qIa;
	Tue, 10 Nov 2026 14:57:57 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnII-00000004IBs-2izC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:57:56 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP8s50MvYz8XrrJ;
	Tue, 10 Nov 2026 22:57:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794322665;
	bh=fxZvD40wCka3RIRc9neoBbabkTYuYltGezERWwCEB44=;
	h=Date:From:To:Cc:Subject;
	b=eNsQ+uEjYdr5pfdM0kmpDBpJelZip/ooDIL/RDYvvATk5abHoKJQE+ihOrne0KZGb
	 uNgwn3KDoki2IJXDxcqPRrlEyN+Ws75JBph8C+yN5B/Z6Z1ZL/U3wSh3JPEV0QAz2d
	 wNmW3aDzwpbW9zlxqDAfCGDrCBG5zYRx/9m1Gz2x+BWoJjAh8hOvJ2jqYZ6bvp/hB3
	 r1pxc+A+KZyMBe/BS/uy5pGVn/3za5ItWTkw5QzSbFxuoJVRyRvglig41tnWIXYNWJ
	 PtUFK26sUJDAM7f+9B+Bo5wXFV9DZPZY6CtA/jmcfxA9jOugwW1ZzAh/1UhSc8Rsm9
	 woeLRh5jwWoNA==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6AAEvc0L005941;
	Tue, 10 Nov 2026 22:57:38 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 22:57:42 +0800 (CST)
X-Zmail-TransId: 2afa6af330e63b0-179de
X-Mailer: Zmail v1.0
Message-ID: <20261110225742093XH08EkNNnrDUM6Azn-oCM@zte.com.cn>
Date: Tue, 10 Nov 2026 22:57:42 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <ryan.wanner@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBzcGk6IGF0bWVsOiB1c2UgdGhlIG1heGltdW0gZGl2aWRlciBmb3IgYW4gdW5zcGVjaWZpZWQgc3BlZWQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 6AAEvc0L005941
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 22:57:45 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF330E9.000/4jP8s50MvYz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065755_251147_E9E0CDBC 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shao Mingyin <shao.mingyin@zte.com.cn>

atmel_spi_set_xfer_speed() divides by xfer->speed_hz. That speed can
remain zero when neither the device nor the controller supplies a
maximum, allowing a transfer to reach the divider calculation with a
zero divisor.

Select the maximum SCBR value directly when the speed is zero. This
avoids both the division and an out-of-range divider that would be
rejected by the subsequent validation. Keep the existing range checks
for explicitly requested speeds.

Fixes: d3b72c7e6bf3 ("spi: atmel: add support for changing message transfer speed")
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
This patch supersedes 5/5 of the v1 series; 2/5, 3/5 and 4/5 are
unchanged, and 1/5 is posted separately.

v2:
  - select SCBR=255 directly for a zero speed, avoiding the division
    and the subsequent rejection of an out-of-range divider (Mark Brown)
  - preserve the range checks for nonzero requested speeds
v1: https://lore.kernel.org/all/20261106234803459Z94udUX-Ai29-OfBFRND6@zte.com.cn/

Validation on x86-64 with GCC 13 and UBSAN: the verbatim speed-setting
function ran with clock/register stubs for v1/v2 controllers and native
or GPIO chip selects. Zero speed bypassed division, programmed SCBR=255
and set effective_speed_hz. Nonzero speeds retained the existing
SCBR=0 and SCBR>=256 rejections and the valid-divider register values.

 drivers/spi/spi-atmel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index ffc896e4621acf2f2abfd33981904fae40b08ff5..333423b3111f8b04fbb314da659fc4ac99a390fa 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -923,7 +923,10 @@ static int atmel_spi_set_xfer_speed(struct atmel_spi *as,
 	 * Calculate the lowest divider that satisfies the
 	 * constraint, assuming div32/fdiv/mbz == 0.
 	 */
-	scbr = DIV_ROUND_UP(bus_hz, xfer->speed_hz);
+	if (xfer->speed_hz)
+		scbr = DIV_ROUND_UP(bus_hz, xfer->speed_hz);
+	else
+		scbr = (1 << SPI_SCBR_SIZE) - 1;
 
 	/*
 	 * If the resulting divider doesn't fit into the

