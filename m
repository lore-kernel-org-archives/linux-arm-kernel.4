Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651EE606A89A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8uX+hCW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5NbCA6l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OgsIQxLzQY9h7mZX3W9Y2wTavESqyHYyf1dp59qEWJg=; b=u8uX+hCWO3f2w2
	0lj9ZPXG8AqVP/WDZrCvmJ/hyeUZYM8wm70e2azJzSYfFk7qpFBIViU44JTGWkmhaUh3AIf8SE9Ac
	WwuKl8bIzWqPqUT0CMZY1FZV16G8aWQBvGXF62MWvSC1M52nZDwj+A8SXa+wuVGB5euVb5njVeCgv
	O4QqSrjVRm96zQ1RFJ81iHeJiTCSgfwwQZxPDW2JPnceqZbLCePowa8dnsGIYosKG2tfYrhgvfqjY
	yDBgVqYMd40JSCyvnq9MRBYtqVyVZyi/UDGntFxVWt3n7S+naXBFJmk5BBYjk8iZi5oVl67wuqJn0
	X7yYlrZAsVv8cUwUMe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFs-00000007r4Z-0GZE;
	Wed, 11 Nov 2026 21:53:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFq-00000007r3c-1iGM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:53:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB65942459;
	Wed, 11 Nov 2026 21:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A91F00A05;
	Wed, 11 Nov 2026 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433997;
	bh=OgsIQxLzQY9h7mZX3W9Y2wTavESqyHYyf1dp59qEWJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V5NbCA6lXzqX3mfJcCZr7BG0oiK6pRM3UzqESzQRIQH83Zl0Pf+RCmsZsGtJTRJ+0
	 Xiv6kaRgz8dLWDXtzzO185kcSpb/i0OWzfJ7oSgEnp4PogfG+uLdhlD68ufa1nEqK+
	 XmxG7uHXVTi7sx606OFUxYu6NPrarwuFQJl9NLAHcApDdpKjJizw7tPGaC2qQ/qr7O
	 /cXKFu18JdxyWjnQB6Rj8eZWEgkkXCqytSfTlI7RdzZnDDx5kLMgBe9KPE1M4SwiU8
	 9La0f6m5Vi/NBPlp6/wei6olLiTsZ4UCZ5si1Fw0LsW2GbAHUkDaSTK9xSxTMJM3ok
	 2cxpLKB9CxVSA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 02/10] pinctrl: nuvoton: ma35: Prevent out-of-bounds write in ma35_pinctrl_get_soc_data()
Date: Wed, 11 Nov 2026 21:51:47 +0000
Message-ID: <20261111215256.1982044-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
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

ma35_pinctrl_get_soc_data() allocates ctrl->pin_banks with
ctrl->nr_banks (MA35_GPIO_BANK_MAX) entries and populates them while
iterating over child GPIO controller nodes with
for_each_gpiochip_node().  If the Device Tree contains more than
MA35_GPIO_BANK_MAX GPIO controller child nodes, id exceeds
ctrl->nr_banks and writes past the end of ctrl->pin_banks.

Check that id is within ctrl->nr_banks before indexing ctrl->pin_banks.

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-7f04e7c5-6691-4586-b0f9-392f1285514c
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 408927ab19da..04528e734bc9 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -621,6 +621,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 	}
 
 	for_each_gpiochip_node(&pdev->dev, child) {
+		if (id >= ctrl->nr_banks) {
+			dev_err(&pdev->dev, "Exceeded max GPIO banks (%u)\n",
+				ctrl->nr_banks);
+			fwnode_handle_put(child);
+			return -EINVAL;
+		}
 		bank = &ctrl->pin_banks[id];
 		bank->fwnode = child;
 		bank->regmap = pctl->regmap;
-- 
2.56.0.567.gdb80ae8cd5-goog


