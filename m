Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kYTRDuzV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFbNLJua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N6f1bdC1RKlhZ46MrIQ+rW41AGuli7kkZ2seR2q07O4=; b=kYTRDuzVv7ui2+RZLFb9Yyc8Xi
	k7AX3sah9CY5AA4cbJG8IAHEdS1/1D78EpaTolIBA+vz9BReX/D65SZZ8nKxNycKELagbxhkQQaTk
	xXgM2E3Bp8ht90yObXcRgmDcU/LSmULihZrfcC9bSc47eDXr4FC9J3kkg79pr0+OzvGIsoyUS98lf
	rCwBbPlIEHpiwxHtfE5Q8OAfwqWLKPT+w/g8HbEdG9PQuTNMctfjKgVXUCzXlhVh0eAAMKkP5PqSZ
	h30iuTr8KSOJvyN4lImQwAGPtGbfOY60R02ltIgcurkJEwK9s3i/9Th4LCv7SN30TgO72ijJO5bLp
	nEgHbs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWg0-000000049rZ-1n66;
	Mon, 23 Nov 2026 16:13:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWfx-000000049qc-3SnL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:13:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22BDD61337;
	Mon, 23 Nov 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795450432;
	b=OI3wFX4QrO5Y+JIYXChh3vSCcTlJjaI+fzAjvXG8doWAp9UMhwcJfJRZD9dW49WJvSrp
	 7hgymvKioeBPiaup+TSAj54ZCRCHA1wyHsESZzbTxZX0/UHe+nntkNKLu7Rjj3Lxk9o4B
	 7BkzR6DDzyrearHVyarjT6f5lmAHjYwwJL6pHr0U+Bt2OYlLfBleqFAGX5NP+ZxTXfwxr
	 NAalhmQPV0j3oO359kG8eXXdP2g0O6WpsnI6dzB2zhCmIHoC5Q2MRZI8zTd9aOWgAiFXQ
	 JZPpfQ9ysp4Raezowq3Ar5rse80F6RYtQrgsOqL5SKFLeHRwqNDANp8WacAsp9y8ZFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795450432;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=N6f1bdC1RKlhZ46MrIQ+rW41AGuli7kkZ2seR2q07O4=;
	b=ItjJQZWO/h+9+EcA+J7uDaEj6x0wDlJO/FvzjwZIXSMJhzy7z4ELUOk/LtAs4fduPC6z
	 94Xq/R/5JDBWl1SRxhPLWywmL4M0ioF5/a6xa6Is4EvVZnnR9rZjn4C0W6BPJFSW0EGP7
	 KYOyNHjXHSJp63PXdi6I77aR3F4WMNHwgPR+00FoqBdR5gtiThK+HIAKIPUVKz6rkQHUe
	 V2m9stVXlNzabcyPHR5ir27NQW0xCtYgJv/EvVXR7HhPWfrcsz+kzmXpTnXwQMVOp78Sv
	 yW1KZ3x5sxqiiTDU58I5EahzXGIEgyzUAJ+YBpqpFk0oRXq9vqOnrWzcsLqUn/fSoDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0D0E1F000D0;
	Mon, 23 Nov 2026 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450432;
	bh=N6f1bdC1RKlhZ46MrIQ+rW41AGuli7kkZ2seR2q07O4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PFbNLJuah3rJYkfb416HvxC2fLnCXp/nI6EWd510kt1rCeUqsrvk2H9foVzXK25LA
	 gSWNN5jSNiKGCIeWX2pH/iDYPA9d/Wv1d32gTvvO3u4NQ0oazWE7jIsSUluHpDsd5Y
	 WOtxX2taBZZ/JhQz4GIf84fWhJV8fdmc7BcS4k9ZE49+1s/OM5nYV9veZtdH4xoezz
	 M1sOo4IcjYXiAhRDKlhoXjd5wit52MIvBxvQmpDBiauZjtLNHtuI06aBQ1l+h7LCM6
	 SxjiURgtHeIqzj+A9euSwC/+NRYu3V66cJTwIgx3qsiCyo4Qr9fyrqlw3Z1VcHzLl6
	 IXwJt98yb3s3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F19EA4C53D;
	Mon, 23 Nov 2026 16:13:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 17:13:41 +0100
Subject: [PATCH] Input: stmfts - restore touch after system resume with the
 device open
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-stmfts-suspend-v1-1-4b2276879e8d@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw7CIBRG4a00dyyJ4APSrRgHFn70mpQ2XGqaN
 OxdrMNvcM5GgswQ6ruNMj4sPKUGfejIvx7pCcWhmczRXLU2JyVljEWULDIjBWWddcEBF2/P1KI
 5I/K6D2/3v2UZ3vDld6FavwM1Ec9yAAAA
X-Change-ID: 20261123-stmfts-suspend-7878d8ee5c74
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andi Shyti <andi@etezian.org>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4220; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KNVO9ZDo1+Slo3mWxKh9KjmPpUcwFZVYrPbAM4cSGMI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBGY6XvwXyLW5+kIbRTHAKomf2ED2Khb36UPFU
 nIUpt+8IgKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawRmOgAKCRBgAj/E00kg
 cqHcD/0YaboxDDIX4IJX0IJS7HjXYCpeKTG9ImVlZVgPd7KYZOSA+1O+I5R2IKme1wW99/g494r
 6yCnDHs3fbeKvCqm4+/c+Uf+M5neRHnNma/sGyhCCv92vs+YNm5Qll5VUX/+YpVZGFZ25vUuGMo
 SKpQme4EzmKEZ00d5X0Q9sFiYUOkY+urm2ES5nH4WZtFxWUOrhtjnhwOrvxhvy9p8yJP+D+wtTB
 5J1dyQUR6fLH3iU1SyQfFwYApf/LrgVBxcVTpdZSP7ooKwW8dHEK8JyV+PCcf7WfpvbahaJZpvr
 uuTH1AZE9agPQozA/DnOXIXn2aBkWsQXQANZXyid6kNnZr5czLQ6CumszDUMUKnOWFAB66cLVwh
 HPjxLj+DlI/RSRTicY9G5CdcbihJbCIm8JmwEaARXu4sCg4ihSMP9JgKlzLYRJvjZJc/GXLWO4O
 AP/JMG4PagRurlktcGf38Jyh9Uka+awCwLSZ/RJlzGZuhTMPjeud4pKqipGawbLlL3AATFL9NMz
 GcQSucx6Su8cx6wjzenfD6O/lRztccN85aFpTadwa/bFPioulXZni9op1MrEWnsOBh2AVZ5IOEH
 LaMOsJKUYEd11kGQv6SiOaZRcNnhxkd7CIG0oiSh7IZF1SUpzA+JzicY5VJnIQdsRjI8iyDxJvB
 hlrPWMmv5Yu3ZhQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Heidelberg <david@ixit.cz>

stmfts_resume() only calls stmfts_power_on(), which re-initialises the
controller and deliberately leaves it in SLEEP_IN, assuming nobody uses
the touchscreen yet. That assumption does not hold for a system resume:
userspace keeps the evdev node open, runtime PM still considers the
device active and stmfts_input_open() never runs again, so the
controller stays asleep with scanning off. On FTS5 the controller
interrupt enable command is part of the runtime resume sequence, so the
result is a completely dead touchscreen until the input device is
reopened.

Factor the scan enable part of stmfts_input_open() into
stmfts_start_scan() and, when the input device is open, replay the
runtime resume sequence and re-enable scanning from stmfts_resume().

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 53 +++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 36beea6e6eb28..2054c2254947b 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -563,30 +563,23 @@ static int stmfts5_set_scan(struct stmfts_data *sdata, bool enable)
 	err = i2c_master_send(sdata->client, scan_mode_cmd,
 			      sizeof(scan_mode_cmd));
 	if (err != sizeof(scan_mode_cmd))
 		return err < 0 ? err : -EIO;
 
 	return 0;
 }
 
-static int stmfts_input_open(struct input_dev *dev)
+static int stmfts_start_scan(struct stmfts_data *sdata)
 {
-	struct stmfts_data *sdata = input_get_drvdata(dev);
 	int err;
 
-	err = pm_runtime_resume_and_get(&sdata->client->dev);
-	if (err)
-		return err;
-
 	err = sdata->ops->set_scan(sdata, true);
-	if (err) {
-		pm_runtime_put_sync(&sdata->client->dev);
+	if (err)
 		return err;
-	}
 
 	scoped_guard(mutex, &sdata->mutex) {
 		sdata->running = true;
 
 		if (sdata->hover_enabled && sdata->ops->set_hover) {
 			err = sdata->ops->set_hover(sdata, true);
 			if (err)
 				dev_warn(&sdata->client->dev,
@@ -601,16 +594,32 @@ static int stmfts_input_open(struct input_dev *dev)
 			/* I can still use only the touch screen */
 			dev_warn(&sdata->client->dev,
 				 "failed to enable touchkey\n");
 	}
 
 	return 0;
 }
 
+static int stmfts_input_open(struct input_dev *dev)
+{
+	struct stmfts_data *sdata = input_get_drvdata(dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&sdata->client->dev);
+	if (err)
+		return err;
+
+	err = stmfts_start_scan(sdata);
+	if (err)
+		pm_runtime_put_sync(&sdata->client->dev);
+
+	return err;
+}
+
 static void stmfts_input_close(struct input_dev *dev)
 {
 	struct stmfts_data *sdata = input_get_drvdata(dev);
 	int err;
 
 	err = sdata->ops->set_scan(sdata, false);
 	if (err)
 		dev_warn(&sdata->client->dev,
@@ -1163,18 +1172,42 @@ static int stmfts_suspend(struct device *dev)
 	stmfts_power_off(sdata);
 
 	return 0;
 }
 
 static int stmfts_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	int err;
+
+	err = stmfts_power_on(sdata);
+	if (err)
+		return err;
+
+	/*
+	 * stmfts_power_on() leaves the controller in sleep mode. If the
+	 * input device is open, runtime PM still considers the device
+	 * active and will not wake it up again, so redo the runtime
+	 * resume sequence and re-enable scanning here.
+	 */
+	guard(mutex)(&sdata->input->mutex);
+
+	if (!input_device_enabled(sdata->input))
+		return 0;
+
+	err = stmfts_runtime_resume(dev);
+	if (err)
+		return err;
 
-	return stmfts_power_on(sdata);
+	err = stmfts_start_scan(sdata);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 static const struct dev_pm_ops stmfts_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(stmfts_suspend, stmfts_resume)
 	RUNTIME_PM_OPS(stmfts_runtime_suspend, stmfts_runtime_resume, NULL)
 };
 
 static const struct stmfts_chip_ops stmfts4_ops = {

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-stmfts-suspend-7878d8ee5c74

Best regards,
--  
David Heidelberg <david@ixit.cz>



