Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06143606A80F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=heqZGyAe;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TfzCtLYN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YyReaC6xJTCbGjqg41g4uWdaugUUeN3IKRBOb+F7ocU=; b=heqZGyAebYEU+zNb3sz02WgA2a
	CQ1tEogKEkKQdn6oHsnR6///G0zdizYS+EkEwaeqZudJxfM69u2hVa5+Cvj8v97OrX/T6dhTqVzXV
	qRbDB9ovg0lSVqgiYkr4vSxwybXtDIdD+sUR+awAO+rqmpH8QmABORuwO/azGoR9LRqOYCYo+Eqod
	vObDvCEDNI88IwuUJ0uMebB3aCsCwKgMSkeSzPxZROoKgGh//ubfKQWkjlwBclNLEKBiE+vsgnba3
	vPDzNFafwxzYFQJ/Z3UC/OkjfRPyLTjrQu4gpykWq5fEEqZNC1dbESOy4VvtIy3oQTzqRgCXP4vhu
	QMC9GpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIV-0000000B9ZA-2Y6c;
	Thu, 19 Nov 2026 08:15:11 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIR-0000000B9X2-0Pn4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YyReaC6xJTCbGjqg41g4uWdaugUUeN3IKRBOb+F7ocU=; b=TfzCtLYN53dfs
	6YqgYSPWFMkC35ufvS1qi60C7K1+KUbRyIuipb+RAlam9MhVYMmdyLeFQ9bomS4D
	hoEgwQaT6DGYEjacjTPvBXq9calxBA+Wo78K3QHXyNymvTG5hGVyEjfA36JOeuJM
	qCopfbwzk6Q4lQfX0Ski5lf7vd2HG4=
Received: from 08.eml (unknown [58.206.202.11])
	by web3 (Coremail) with SMTP id ygQGZQCHKYwFsP5qE1LEAA--.1414S2;
	Thu, 19 Nov 2026 16:15:01 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: lee@kernel.org
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] mfd: stmpe: Disable regulators on probe failure
Date: Thu, 19 Nov 2026 16:15:00 +0800
Message-ID: <1795076100902-8-fa247961@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: ygQGZQCHKYwFsP5qE1LEAA--.1414S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw13AFy7Gw48Zr17uw15Jwb_yoW5uFWkpF
	WDXrZYkrs5WFW0kws8Ar1xZas3KrW7ZrZ7CrykW3yrZws8uFy7JFZ2kr1FvFn5XrykJ3W2
	yFZFvry0kF12qFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU5FApDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIQD2r+rloDYAAFsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001507_152948_333C50D5 
X-CRM114-Status: GOOD (  10.81  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmpe_probe() enables the VCC and VIO regulators early in probe, but they
are only ever disabled by stmpe_remove() on the successful unbind path.
Every failure return in between leaves both rails enabled, and a later
-EPROBE_DEFER retry enables them again, so the enable counts grow on each
failed probe and _regulator_put() warns on each leaked enable.

Register a devm action right after the enables that disables any regulator
still enabled when the probe fails or the device is unbound, mirroring what
stmpe_remove() already does.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
---

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index fd51ba74275c..9475a257acdb 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1363,6 +1363,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 }
 
 /* Called from client specific probe routines */
+static void stmpe_disable_regulators(void *data)
+{
+	struct stmpe *stmpe = data;
+
+	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
+		regulator_disable(stmpe->vio);
+	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
+		regulator_disable(stmpe->vcc);
+}
+
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 {
 	struct stmpe_platform_data *pdata;
@@ -1417,6 +1427,11 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VIO supply\n");
 	}
+
+	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(stmpe->dev, stmpe);
 
 	if (ci->init)

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    reg_vcc: regulator-0 { compatible = "regulator-fixed";
        regulator-name = "stmpe-vcc"; regulator-min-microvolt = <3300000>;
        regulator-max-microvolt = <3300000>; };

    reg_vio: regulator-1 { compatible = "regulator-fixed";
        regulator-name = "stmpe-vio"; regulator-min-microvolt = <1800000>;
        regulator-max-microvolt = <1800000>; };

    i2c@0 { compatible = "i2c-gpio";
        sda-gpios = <&gpio0 0 0>; scl-gpios = <&gpio0 1 0>;
        i2c-gpio,delay-us = <2>; #address-cells = <1>; #size-cells = <0>;
        stmpe811@41 { compatible = "st,stmpe811"; reg = <0x41>;
            vcc-supply = <&reg_vcc>; vio-supply = <&reg_vio>; }; };

The stmpe811 node has no interrupts property, so the probe enables both
rails and then returns -ENODEV on the no-irq check.

Trigger:

    modprobe i2c-gpio
    modprobe stmpe-i2c

Result:

    stmpe-i2c 0-0041: stmpe811 configured in no-irq mode by platform data
    stmpe-i2c 0-0041: stmpe811 does not support no-irq mode!
    WARNING: drivers/regulator/core.c:2678 at _regulator_put
    WARNING: drivers/regulator/core.c:2678 at _regulator_put

Two warnings, one per leaked rail, and the regulator use counts go from
1 to 2 after the failed probe.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.


