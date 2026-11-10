Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073860A2615
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11D2ycKj;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=PiDZQtwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C10R9+FsWtdMXyeOnMpjjihgOFuMfyeb6FQIN+FCe78=; b=11D2ycKjK5eT4T
	uZ7DQCKjWBPZ+57j5GWoVVy0/kjVer2d2XcZltYxtocUNCuLjvwqz/n+0WNdnzOkPgVSO3LYTnNEq
	GmPu/ImRTeiYCwbvaxOzmjk8mG5wfsEVh1aoU58iDu3rZ4VFL1bvcjMr9j+J2ggCG0JQhHjC4Ebxm
	Qzh1uhC8TetOhSbud+pq/g2xyDSTPA+8avWCg/HIVNS675DUaSdfCzNNe2pCCE5lvWZ0zIaeo+YaS
	wL3i9wNy/lor02Y9Og2N/tJmBA/jIhkYfvhTCuppik6k1QzybNMcMbxRluJGWJXJycrZ7psuC/izc
	GnfRW2BXeeIywn6u6cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjO1-00000003Vwo-1di0;
	Tue, 10 Nov 2026 10:47:33 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjNy-00000003Vuh-2DPh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=C10R9+FsWtdMXyeOnMpjjihgOFuMfyeb6FQIN+FCe78=; t=1794307650; x=1795517250; 
	b=PiDZQtwN0HO5wNof5YWjTzO6nsgdKHbxMinWa1LC7wHGiPITMUnloDTU6hksRfAmU+ZRnncsGqD
	tVe76XTo9Ms24XQ9GDzHPL/lEgIgQzDL9SyK3w+d25m35zzn2YmX5Ps8tIPMrVaitKtYvFB6JNfs/
	SYskLGo71tT9/pOmBAPI6tFnHLh64Fy+XCW4udSHeUh9Ok2R4fGr38HALZgHgmY6naZOodMRzjsAP
	cG32svVqr+yJnpF9AUUqVnQr/OrBAEuS9ITQp6cif2ZgjrfhO47UYR8Kct0emwkLfGSlpR5Jt3EG0
	HzXUwi/tbJ79e7RiOB1I49HgqujDDNds11FQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 10 Nov 2026 11:46:12 +0100
Subject: [PATCH 1/3] bus: ti-sysc: fix I2C quirk for OMAP3 variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-i2c-sysc-v1-1-8945eb1d38f0@kemnade.info>
References: <20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info>
In-Reply-To: <20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3381; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=t9Vuz4zKzjtP9j2cZP3ABiVFU0YuIep4VHnJSsSDv6Q=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq8vX4KDPD9hphPkFWgs6qwxkiFIyIP2rWdSR8Y
 ztME4q1lH2JAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCavL1+AAKCRCEYUX6QCjc
 8XwlD/0XGK2uWBDG8ZRUYitwjUwJNMi5aeiX/b1BUh1+ElNw2GlpojKDrHCrJzJ/f0y87xljHMC
 fTCXvMSBcUS3hXYa7Z/rpjIdg1VBBwTRz1EciGFBgARwTbMl88EG20eQUTCzqq5TUeFnyq7HmsQ
 skhnhP/h2Wc6jSjYR2EAyzuIrvblUvakpc5Gl7z/9AGnF2St3l3hDQEjyKqOua0cl7u5BN422dI
 A4UGR8E5tLIQ42or3a2LuwQ3Dhj4xdcEVoZVgEfkF8CiMfMw5wzOx2JsNHTFfxgwwXXQcgBXrKj
 DpGXcf7GkmhNj9by3nnf3ng49EExKd0srP+DAUSOMlxti0rsoE3SVJ5h1So6wJ5MxWzHGclck/w
 jpxvqKP0hM8LwUHgJqiMcwX5mkxYnnOqrinjoZ7h61+HUIBHxKmDbANWONMnP8Tk7/0FzldhdQi
 TJzw4ZR3Ag6GAPY2e/e+tF0T8JIao2SiJKSkfvIcjQLtRuRr/7OHVrV681q8uq04Ylmy8tG2IUh
 iBn0Q4WiTczXCcDgKU4NxLw/l+dyglPG/pVEEdwRzTO0XpiuWi7SN8lXbxK7XMv2rHIpGdJF3Gt
 pf1fycvSr6ca4Wn3+zBc39B1iyZyfyXZ+Lcgt/Mfdqa0tNfmh0RpDuuvxNPzMKTgDuLsUT3gFar
 QI1ee16EJfwKITQ==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024730_575980_42C16824 
X-CRM114-Status: GOOD (  15.39  )
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
 drivers/bus/ti-sysc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 12285ad9ef51f..c07a0e1f9a878 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -153,6 +153,7 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
+	bool revision_doubleword;
 	u32 sysconfig;
 	unsigned int reserved:1;
 	unsigned int enabled:1;
@@ -179,7 +180,8 @@ static void sysc_write(struct sysc *ddata, int offset, u32 value)
 
 		/* Only i2c revision has LO and HI register with stride of 4 */
 		if (ddata->offsets[SYSC_REVISION] >= 0 &&
-		    offset == ddata->offsets[SYSC_REVISION]) {
+		    offset == ddata->offsets[SYSC_REVISION] &&
+		    ddata->revision_doubleword) {
 			u16 hi = value >> 16;
 
 			writew_relaxed(hi, ddata->module_va + offset + 4);
@@ -200,7 +202,8 @@ static u32 sysc_read(struct sysc *ddata, int offset)
 
 		/* Only i2c revision has LO and HI register with stride of 4 */
 		if (ddata->offsets[SYSC_REVISION] >= 0 &&
-		    offset == ddata->offsets[SYSC_REVISION]) {
+		    offset == ddata->offsets[SYSC_REVISION] &&
+		    ddata->revision_doubleword) {
 			u16 tmp = readw_relaxed(ddata->module_va + offset + 4);
 
 			val |= tmp << 16;
@@ -761,8 +764,10 @@ static void sysc_check_children(struct sysc *ddata)
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
@@ -1527,9 +1532,11 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
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
@@ -1872,7 +1879,7 @@ static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
 	u16 val;
 
 	/* I2C_CON, omap2/3 is different from omap4 and later */
-	if ((ddata->revision & 0xffffff00) == 0x001f0000)
+	if (!ddata->revision_doubleword)
 		offset = 0x24;
 	else
 		offset = 0xa4;

-- 
2.47.3


