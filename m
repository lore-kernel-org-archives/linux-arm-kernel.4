Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J4pF++Qq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQ2BVxqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=; b=J4pF++QqossjfD
	JiaYM/ug5FuDBrJaFpCQfFSzuY6x+EMV5+QGC9QClRkuis3C0J+T+4IGLN0xHz2lfsSDhouvPNUpz
	FYC6R5YpdMkebEIkI6B5APpQssFYitB/Y+3THzNiD+oU17Kkx2QsPwqBYBHxuHRDR4VGFRzo2qh6a
	yWdHSdhs0BUtKB4qOO59uRxOfsSRUMWDHWU8QgPKt8qd+9UqFzE84TsUvgM+cGJCrvvp9O81sIzF1
	4xP4VRYLl52xnLHH91ROO7y2ClVwn5Ve86YtXvgcoT+Yi2Jx5U8uG/2nzhOClFqdJfbeF09soi48h
	vZ2JFglzmR1prTxfMMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUf-00000002ISq-2wQX;
	Mon, 23 Nov 2026 05:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUa-00000002IRp-0WOI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:21:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 946BB609A2;
	Mon, 23 Nov 2026 05:21:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795411287;
	b=fDZ/Vm+9Uic3djgINJcJpL1wL7G/QXj3+RBOkRKUl6rFheQqP3idkNP7g2HGa9DZi3t0
	 qx28+saUY2QjOCx0cnYorigmBlg1YBLZtK9tSmwl1r+9hAzZEF/7AaG65gq9AmdDSUBVr
	 OreZp3R3a6WDqNXIisAe4cxJmhFgXSgNa1c4NJ29C3bi7g4GHBQECkrjFBYZOKK4RvjHF
	 IYp7i7ant9tBlOZeddQtdw8NKTixJBSGXUGqEQTfJJUs9+64EWghE9PyC/4RF0v/0PVb8
	 GnVmxUgU212705ABKj4mzydSJXdY0ue/sNDFcdOJqpCVyXv9T8GM1n2dI6l9f3PpZFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795411287;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=;
	b=oVuG0iQJTozwQgZF0rd2BTZ7n03+75l+wYdn9swW7nMH/HZ+lTP33ZG6kOmUHvNP92ow
	 +vpjBHDQOUXwN8Abom8nXiDcTv6SN2jkoMNksoHoRIe3rH0qlWfl8GWuXCA5UhTlbrFsJ
	 aovHBPbVodwbFWRZkMWAS4lQWXo29Kl6ovQ65rykzErx56TSzipldOlZHmtmKzOgnTYur
	 WT8hfCUiIiw0i4X5Ed5ixEu2of0FAgu00hGB1QhwU0n55o5ckNC5Is35LjLJQ0hIEjY3u
	 5PMpX0OshJh+FrIFjPYLKs+mCbhTnPm+UTO7eu3ruZa47b6euuwck7CwlEBvAv/XayA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 069021F000C4;
	Mon, 23 Nov 2026 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411287;
	bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oQ2BVxqpYQxzsXCKuYkngUCkKLLnSJ/L8VOCPSIgabXEqS0Fz58c/OsypbV2JVF8Y
	 Ks62+ubayJ1SKsiH3DipajYunCoYV5xzDEwSWtQH7Dq+omsdEVQwYZmZFsuhCi3NFb
	 Tr1rfFgaWzNimzL7LlL1QGfHfxYyFaTsNxsbM6wQFiSWhMCrIETr9ISm6sOnBzYY/K
	 rSflXrkHcBzyLHwmBGCDDbzjrHbYitIjFw0mk3q2yLSJArz/Xzxs3179S+su2rq2xV
	 40lTVSIT1U4NclvUzbH7Np1pKhUEkn2PW8yKihN+7WNcSV0W42bAgT583NCuUJl9ec
	 SPh4jvjt7a9SA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8B1D34C369;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 05:21:19 +0000
Subject: [PATCH v2 2/3] cpufreq: kirkwood: Put clocks on error and in
 remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-cpufreq-leaks-v2-2-29277f2f0ddd@gmail.com>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
To: rafael@kernel.org, peter.griffin@linaro.org, viresh.kumar@linaro.org, 
 krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411278; l=2983;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=skKpKTVz2FV0rjzQ/HU+MrfER9ugcIz07303IiHkuCA=;
 b=UPoXqPwfi7sqibeZkQBI2n2W3jEpM9Gv1xvuyRMh3rKKVoRtYJgvPl7KLvAY8EwY5RNOhb6YI
 8eZ5Nd4cu8WARZRH4a3nnriXPwTg02hdU0yTOgwmHtGIZs8q+csiewt
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

kirkwood_cpufreq_probe() gets three clocks with of_clk_get_by_name():
cpu_clk, ddrclk and powersave. None of them is ever released with
clk_put(). The error paths only disable and unprepare the clocks, and
kirkwood_cpufreq_remove() does the same. So the clock references leak
when probe fails (for example on -EPROBE_DEFER) and on every unbind.

Add the missing clk_put() calls to the error paths and to remove. The
"Unable to prepare" paths now jump to new labels that only put the clock
that failed to enable.

Found with a static analysis tool and checked by hand.

Fixes: 2a4bd9f0db24 ("cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs")
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index 24b285cbeb8d..e85658081c07 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -125,7 +125,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.cpu_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare cpuclk\n");
-		goto out_node;
+		goto out_put_cpu;
 	}
 
 	kirkwood_freq_table[0].frequency = clk_get_rate(priv.cpu_clk) / 1000;
@@ -140,7 +140,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.ddr_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare ddrclk\n");
-		goto out_cpu;
+		goto out_put_ddr;
 	}
 	kirkwood_freq_table[1].frequency = clk_get_rate(priv.ddr_clk) / 1000;
 
@@ -153,7 +153,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.powersave_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare powersave clk\n");
-		goto out_ddr;
+		goto out_put_powersave;
 	}
 
 	err = cpufreq_register_driver(&kirkwood_cpufreq_driver);
@@ -167,10 +167,16 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 
 out_powersave:
 	clk_disable_unprepare(priv.powersave_clk);
+out_put_powersave:
+	clk_put(priv.powersave_clk);
 out_ddr:
 	clk_disable_unprepare(priv.ddr_clk);
+out_put_ddr:
+	clk_put(priv.ddr_clk);
 out_cpu:
 	clk_disable_unprepare(priv.cpu_clk);
+out_put_cpu:
+	clk_put(priv.cpu_clk);
 out_node:
 	of_node_put(np);
 
@@ -182,8 +188,11 @@ static void kirkwood_cpufreq_remove(struct platform_device *pdev)
 	cpufreq_unregister_driver(&kirkwood_cpufreq_driver);
 
 	clk_disable_unprepare(priv.powersave_clk);
+	clk_put(priv.powersave_clk);
 	clk_disable_unprepare(priv.ddr_clk);
+	clk_put(priv.ddr_clk);
 	clk_disable_unprepare(priv.cpu_clk);
+	clk_put(priv.cpu_clk);
 }
 
 static struct platform_driver kirkwood_cpufreq_platform_driver = {

-- 
2.34.1



