Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827A606A901
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4r0u3yIj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FP+rIsy+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pgdtqChxS/6Gzw+/Chi3si2+lQ114SNwivuAZLc2ooE=; b=4r0u3yIjzMWtFj
	j/oq0819mPbYQBr7vLsAiKoMwTvpdyD6fYxAvsjkyU9vDadHVp7dwd1dKHrUwVbJPgGScStA3HpcS
	Hpud586hMoW7sNXkpeiirPUdK5V4/kUUmrUulTM7itaiknbjHneJjtvmhNHtpcsSksIVxLRn4vP1b
	rBnm6E9qAdMf1A9rSCZf2dgVqh5iPXZFB5UcthJ0VHPetoiEpGbgCdMVzhGaYx8+L3ib/Red23J6a
	8HiYvlZpcPm8vZ4lH4yaMVhhRr1HjsP7PHcZY0dKKBV4N5vW/0EkkN+aU9sggUiyv5LbGZLbrEZSE
	I322+y4L+fSY8O8rpIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95g-0000000DQJw-1kga;
	Thu, 19 Nov 2026 20:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95b-0000000DQIo-2mFL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:50:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20BE960D80;
	Thu, 19 Nov 2026 20:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1D41F000CF;
	Thu, 19 Nov 2026 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121438;
	bh=pgdtqChxS/6Gzw+/Chi3si2+lQ114SNwivuAZLc2ooE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FP+rIsy+3dmIp0iEbCmVGWcSC8n9qkS4YQVT1wuluuRISz0UpvolTRxDljRoVsHoN
	 146J1r2++i3f8/25DBDDo5khOlcNMqSkC0Xy/a/3TcLDpZ6pL5ZC6Nt3kzfDuF3sKq
	 ce5loTCd82CaYmojhcit4YAkBUi/nRv/Ts4MTUEYc4UVB9WQBNH2nHRDPQ869uJ+cB
	 aYcuU7/hEKN7yelKP/8mlIeRZ7DBZ5mnwHepofn+yUiEX0ZE9o8Z/9I83HRb+AFsNI
	 9lF1gKeOAaSdRmc8g135rKPi7LciPOEQ0TIw5+AG+ik8Qj7U/b9IfRN0Tj9CKQjlq3
	 cXaKIIXdx407Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 03/12] pinctrl: nuvoton: ma35: Retain child firmware node reference in ma35_pinctrl_get_soc_data()
Date: Thu, 19 Nov 2026 20:48:59 +0000
Message-ID: <20261119205013.2563811-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

for_each_gpiochip_node() drops its reference on each child firmware node
as the loop advances.  Storing child directly in bank->fwnode without
acquiring a reference leaves bank->fwnode dangling once the iteration
moves on, leading to a use-after-free when ma35_gpiolib_register()
accesses bank->fwnode.

Acquire a reference on child with fwnode_handle_get() and register a
devres action to release it on probe failure or device teardown.

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-f140abe2-145a-4f6b-b626-bbabdc7327c4
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: New patch, retaining a reference on bank->fwnode (Sashiko)

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index aff2212c6278..c9e09c14a101 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -556,6 +556,11 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 	return 0;
 }
 
+static void ma35_bank_fwnode_release(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static void ma35_bank_iounmap(void *data)
 {
 	struct ma35_pin_bank *bank = data;
@@ -629,7 +634,14 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 			return -EINVAL;
 		}
 		bank = &ctrl->pin_banks[id];
-		bank->fwnode = child;
+		bank->fwnode = fwnode_handle_get(child);
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       ma35_bank_fwnode_release,
+					       bank->fwnode);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
 		bank->regmap = pctl->regmap;
 		bank->dev = &pdev->dev;
 		ret = ma35_get_bank_data(bank);
-- 
2.56.1.750.gf70dc682cf-goog


