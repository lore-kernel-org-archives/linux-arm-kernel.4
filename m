Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4543606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JZ75zoNK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9E90ItZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oWPaAbrk1SEcMLu1P1StU6pA1o5GcIUF8D/f2zRIa00=; b=JZ75zoNKvksRoV
	ZG8uAhrbNIK/7/fhgXfJfhVVqW7oqJhbrJnQdO78+30sxV+BB7OIqk0xn18CXP6ThPVNEjjL0cTYA
	nvxkwU6n27EDl3S7ZFOTvNWUmlDKvr5LQ3iq/K92gef89K23jsJ078NnMxNQwJT7x2H7WJw/Q3FpS
	XuzJKFNs3ZiTEhsPg1A6bJNNtKQwO4wLd0p+PPQ04opvT3xNMfLKEA/YH0/8KkupLyhz+YmxK4v9J
	lsoxkFE8jOiM0pdqjrIrEJBMNmg6yFsKJTf9dJrkPNtrabs8zLywMbyJDgc5a8/Ka+EXF+jA1yIEW
	MExIGKWd8MifGxtyRh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwaw-0000000GKeb-3GTw;
	Fri, 27 Nov 2026 14:06:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwak-0000000GKc6-47lg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:06:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F5FA61213;
	Fri, 27 Nov 2026 14:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F51F000C1;
	Fri, 27 Nov 2026 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788382;
	bh=oWPaAbrk1SEcMLu1P1StU6pA1o5GcIUF8D/f2zRIa00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G9E90ItZmIGiWx19nsuvsJNsoVKuLZXeqDT8FdFLzIUeZU4095IWwoNcB1R1xZ51B
	 FPOQAxzwwA0AznuNuRY0BeYH2bWQ+EAgcWngwIqTMkvnovQIStGh/TrcP0GMnFSDfC
	 ildnlU2pOgeOElXR72AOiq9KGbeKCJQ8j8qg/tYf92X49W6V0nYDp9y7NvdX69EiWn
	 lCY8YECsly+vlYjFUDSyYULQPKGV90A8tO5yGoXXeCSgQHzjWpZdzftdLWLERlyDxg
	 XudKQg3Xa6jaE+0wre0YvjaJTJyudHB32eCbOu+rc7b0tbWENOPCeXAhv+V9YLVD+I
	 CSkKKKwcDA3Vg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 02/12] pinctrl: nuvoton: ma35: Prevent out-of-bounds write in ma35_pinctrl_get_soc_data()
Date: Fri, 27 Nov 2026 14:04:50 +0000
Message-ID: <20261127140602.2790001-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 872769db244b..ddd3f4329f67 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -623,6 +623,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
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
2.56.1.839.g22a8290db9-goog


