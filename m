Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8160A6F6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYYIlZYp;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=W+Abe8Dd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=98mB3tNx1Zqx3Y3TXzTbQ9lVMgUg1AIjcAlJeoXROiA=; b=CYYIlZYpG5N27tVRPLJJx3QuLm
	jx7bMm9wSdXg9tms6I1rxlDFUa7AjepIHaVFXGqgLju/7EuztXBiArrU0+cMlrD1ETZIF8kOimHAJ
	cz3jtdLiLRxsQ8uevxDky3GQ136dNOPEvcuj7arfEt/+x4nDCttVdhqLYBGY886BXrNO48cJ9k4bF
	s7UCiCV84zHP/7B3lb24rQcoM2v2DnYw2olbkZiAuR+UHLZ9/tJqxaJ0HcaSQeMnfs1uE9CisW4K0
	N7PiIc46NnAay/SMgU5uV8Rb3EVYUQRMNt7A/Q4jtynqdsQA4g7KsqYlS1T38EZo1WPR0Th6oIiCG
	5biCEmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIO-0000000B9Vn-25lS;
	Thu, 19 Nov 2026 08:15:04 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIJ-0000000B9Tp-0xMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=98mB3tNx1Zqx3Y3TXzTbQ9lVMgUg1AIjcAlJeoXROiA=; b=W+Abe8DdNUkur
	gwI933OxO6aMKmuKqHTdzCjRjdB1sJDkR1DumvIw3LpjUFi8mVO/zPm0kyejQWJA
	tWjZZfP9A8/+vb32KEbObkcMvFaxw3ECFbElLev8Zd6SX17oH4cWTETvzriUgOEQ
	aOVJksV+g2IrZwsYkoZ1pAMa6/Opts=
Received: from 03.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQBnlmr8r_5qPiJLAQ--.41774S2;
	Thu, 19 Nov 2026 16:14:52 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: linusw@kernel.org
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] clk: versatile-icst: release regmap on registration failure
Date: Thu, 19 Nov 2026 16:14:53 +0800
Message-ID: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yQQGZQBnlmr8r_5qPiJLAQ--.41774S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF43JF1rWw18tFWfXw48Crg_yoW5Wr18pr
	Z3ZayrKw4Igr4vgFWYqa18uFy5KF92yFW5uw1fJw1vy3Z0gryrtr43Xay3C3Wqgr4rGa1j
	qayqk3yIkw4DAaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx
	0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8ZwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUb58n5UUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgAQD2r+rloDXgAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001500_904308_22C59505 
X-CRM114-Status: GOOD (  10.93  )
X-Spam-Score: -2.8 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

icst_clk_register() creates a non-devm regmap with regmap_init_mmio() and
hands it to icst_clk_setup(), which on clk_register() failure only frees
its own structs and drops the regmap pointer, so the regmap and its
debugfs entry leak permanently. A name clash is a natural trigger: a DT
with N same-named auxosc children registers "osc" once and then fails
-EEXIST on every subsequent registration, leaking N-1 regmaps per boot.

Release the regmap with regmap_exit() when icst_clk_setup() fails.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
---

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 37334afee040..e9c7353aa5d5 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -407,14 +407,18 @@ struct clk *icst_clk_register(struct device *dev,
 		.reg_stride = 4,
 	};
 	struct regmap *map;
+	struct clk *clk;
 
 	map = regmap_init_mmio(dev, base, &icst_regmap_conf);
 	if (IS_ERR(map)) {
 		pr_err("could not initialize ICST regmap\n");
 		return ERR_CAST(map);
 	}
-	return icst_clk_setup(dev, desc, name, parent_name, map,
-			      ICST_VERSATILE);
+	clk = icst_clk_setup(dev, desc, name, parent_name, map, ICST_VERSATILE);
+	if (IS_ERR(clk))
+		regmap_exit(map);
+
+	return clk;
 }
 EXPORT_SYMBOL_GPL(icst_clk_register);
 

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    reserved-memory { #address-cells = <2>; #size-cells = <2>; ranges;
        icst-regs@7f200000 { no-map; reg = <0x0 0x7f200000 0x0 0x1000>; }; };

    syscon@7f200000 { compatible = "syscon"; reg = <0x0 0x7f200000 0x0 0x1000>;
        osc@0 { compatible = "arm,versatile-cm-auxosc"; #clock-cells = <0>; };
        osc@1 { compatible = "arm,versatile-cm-auxosc"; #clock-cells = <0>; }; };

Two same-compatible auxosc children make cm_osc_setup() run twice at boot
via CLK_OF_DECLARE: the first clk_register("osc") succeeds, the second hits
-EEXIST and its regmap is leaked. No trigger action is needed.

Result:

    (null): error -EEXIST: failed to register clk 'osc' (0xffff000003407600)
    ===== LIVE REGMAP INSTANCES =====
    drwxr-xr-x  dummy0
    drwxr-xr-x  dummy1

dummy1 is the regmap leaked on the failed registration (dummy0 belongs to
the successfully registered clock). N duplicate nodes leak N-1 regmaps.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.


