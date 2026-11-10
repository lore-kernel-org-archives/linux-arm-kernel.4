Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D18606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lr+2QB37;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=7NUqDWjU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dXCuq2UUHkVfdRR2CGD3wUJ6wRiR6sYg6WrdOE8wYvA=; b=lr+2QB37toXla8
	vKu3GfPOFbdQ+5nRmrbh6UktuzkWByaeEI589hMzxyTvHz3rFVRsw4iSrnxhzFV0dz/EefU05V3Xg
	ZQBywJAiFyYfy1UmqGjNgWhN7iA0j8bbjXovXPs3Z17hJE8ES8InIO89sircpla75IQopRS1nTaCk
	zltXk6A4YE1M5OfW23j5F83MQGKBRJ4iLL9f/8eny7hT8hlRorkRmyAJ5M+BC+YE6WMY9LKWq2rQj
	DEjxoiETFOpYueGjLVlHUsFWprammhTbx2ap1h1TLgW8YbrO4QXD6neSNYQl+lnX+fL6tnXhvLlvT
	EMoCAy8mDLGZHDYgFfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsu7-000000051PC-2kbe;
	Tue, 10 Nov 2026 20:57:19 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsu5-000000051Na-1Udl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=dXCuq2UUHkVfdRR2CGD3wUJ6wRiR6sYg6WrdOE8wYvA=; t=1794344237; x=1795553837; 
	b=7NUqDWjU5uDdYd96AMTcqO42thZzO7UDGq1MVUTGaAzpJvtzapQTfTch5BXqPrJRdiY1+BwPjGA
	I0EaXMmbtcd3vlF97x/WPqKkzvrzG59+ewqVmBR3kzXxFDH6Y/VBmfupwJaEZbC91HBk07rYkzUwz
	74lkibp9qtMtB7cvjtDuDQKeMMTl9cu3Bde4KMzDz+4EqZldIHyGvxiH5ftiR8hsE3OC0v/jD35NR
	lZC9p3zp4LCUIDTOTbBzRfyl+Wf8nTfzKVKOVjijN6SjZpE3r7zIa9y+szfKbKPBRigJgEuzXXYIb
	lM/AY41n8oeu6Tgb+jgWJAcBIm9qsswvz69w==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 10 Nov 2026 21:56:03 +0100
Subject: [PATCH v2 1/3] bus: ti-sysc: fix I2C quirk for OMAP3 variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-i2c-sysc-v2-1-490cda69e350@kemnade.info>
References: <20261110-i2c-sysc-v2-0-490cda69e350@kemnade.info>
In-Reply-To: <20261110-i2c-sysc-v2-0-490cda69e350@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>
Cc: Sicelo <absicsz@gmail.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3812; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=spK2D3wlMYUOw2UhQTPq3R1qCE5m8mwCgRebYbOUJKM=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq84UBH3JOtoPn0jpL7rZWb1doXPYh9eVqc9OsG
 zD8eZWvn4mJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCavOFAQAKCRCEYUX6QCjc
 8b2mD/4t7VfzQMH9GICTIWiuugS8srXdMMyjJ5v0HKTquv+yKMbnr5j8lL1BIOgpRWajgv4QZks
 0UOzYbO1NPF7ZOZTy02uL4sql4nKHnp58kzoPdPP08Tl6/KlAe1cjWu6IZZt5+HgIcUnwACXzZE
 3wzFYHN3g1V0xaAYGiD6j1JrDSVOSVxZBvJtVNWF3oex9RA6ZNKMkAR6cDSUTImqGgw2n1CKlJb
 CjV1af/8VqT8gP0HX+PsNvewlZg5KpvQwoNZxD/M5AtOIxoQ6JPHAH6sImRYLUszUlOJbTmhl9f
 TCN/KMcREj8w03UuI2+M0Ki4TSqxOaAvm98y5JlFirFv3WullWhj9FJGhKV2DXpqb3IlPm/+o89
 untRwHHLjKo/EZwJfTnLUSHU6ru4Q4qUELzjZGbcM0MSIO7fRolSa0NIZMc7xvzxY5XnqF/+hzx
 GV+svzlBoFasqANPXscDs0KS7RkKAGSeNifxhII8F8+Kn08bQLvwDOPqVii0+KSTDgvm31wEqFk
 XoEiLE4RMRw4kAJ5cXDfStfH6CApTnkrX9PgUvVQHcGlA+Fujl6daqSrpAtcCTU3FWeP3xGpDAf
 SaPKKYV046y02fjR/H7x4oT26u2VtsQnumiyof84iqIpoGTqdWvUaxlD48C0CcEfvEgytCulCCY
 T/zE33SN5T57hYg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_125717_403932_C77BC3C3 
X-CRM114-Status: GOOD (  16.78  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

OMAP3 has only one revision register, not split across two registers.
Do not try to interpret the interrupt enable register but instead
use the size of the revision register as indicator.
Specifying a fake 8 byte range and the original quirk only works if
u-boot has not messed around with the interrupt enable register.

Fixes: 4e23be473e306 ("bus: ti-sysc: Add support for module specific reset quirks")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/bus/ti-sysc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 12285ad9ef51f..400259d1fc2da 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -122,6 +122,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @cookie: data used by legacy platform callbacks
  * @name: name if available
  * @revision: interconnect target module revision
+ * @revision_doubleword: revision is stored across two words
  * @sysconfig: saved sysconfig register value
  * @reserved: target module is reserved and already in use
  * @enabled: sysc runtime enabled status
@@ -153,6 +154,7 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
+	bool revision_doubleword;
 	u32 sysconfig;
 	unsigned int reserved:1;
 	unsigned int enabled:1;
@@ -179,7 +181,8 @@ static void sysc_write(struct sysc *ddata, int offset, u32 value)
 
 		/* Only i2c revision has LO and HI register with stride of 4 */
 		if (ddata->offsets[SYSC_REVISION] >= 0 &&
-		    offset == ddata->offsets[SYSC_REVISION]) {
+		    offset == ddata->offsets[SYSC_REVISION] &&
+		    ddata->revision_doubleword) {
 			u16 hi = value >> 16;
 
 			writew_relaxed(hi, ddata->module_va + offset + 4);
@@ -200,7 +203,8 @@ static u32 sysc_read(struct sysc *ddata, int offset)
 
 		/* Only i2c revision has LO and HI register with stride of 4 */
 		if (ddata->offsets[SYSC_REVISION] >= 0 &&
-		    offset == ddata->offsets[SYSC_REVISION]) {
+		    offset == ddata->offsets[SYSC_REVISION] &&
+		    ddata->revision_doubleword) {
 			u16 tmp = readw_relaxed(ddata->module_va + offset + 4);
 
 			val |= tmp << 16;
@@ -761,8 +765,10 @@ static void sysc_check_children(struct sysc *ddata)
  */
 static void sysc_check_quirk_16bit(struct sysc *ddata, struct resource *res)
 {
-	if (resource_size(res) == 8)
+	if (resource_size(res) == 8) {
 		ddata->cfg.quirks |= SYSC_QUIRK_16BIT | SYSC_QUIRK_USE_CLOCKACT;
+		ddata->revision_doubleword = true;
+	}
 }
 
 /**
@@ -1527,9 +1533,11 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x00000036, 0x000000ff,
 		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x0000003c, 0x000000ff,
-		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE |
+		   SYSC_QUIRK_16BIT | SYSC_QUIRK_USE_CLOCKACT),
 	SYSC_QUIRK("i2c", 0, 0, 0x20, 0x10, 0x00000040, 0x000000ff,
-		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
+		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE |
+		   SYSC_QUIRK_16BIT | SYSC_QUIRK_USE_CLOCKACT),
 	SYSC_QUIRK("i2c", 0, 0, 0x10, 0x90, 0x5040000a, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_I2C | SYSC_MODULE_QUIRK_ENA_RESETDONE),
 	SYSC_QUIRK("gpu", 0x50000000, 0x14, -ENODEV, -ENODEV, 0x00010201, 0xffffffff, 0),
@@ -1872,7 +1880,7 @@ static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
 	u16 val;
 
 	/* I2C_CON, omap2/3 is different from omap4 and later */
-	if ((ddata->revision & 0xffffff00) == 0x001f0000)
+	if (!ddata->revision_doubleword)
 		offset = 0x24;
 	else
 		offset = 0xa4;

-- 
2.47.3


