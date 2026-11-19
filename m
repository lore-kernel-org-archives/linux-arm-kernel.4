Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39816606A904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lzxohmxU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QARB3Y4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/nxwbLVlzw8b/oIml8BsGvUkwKG9+QxjgDCbUHFmmjI=; b=lzxohmxU1kUp4j
	0NJ7CSfoB2Pr/Iv0uQ2l3c91PQxC3rFeNtTx+/uivn4rk/nk9QALwIOmIOJG0ITsBwcfqy6jZdOTS
	yVPZBYR0WEMlCnZuufiY6KNri5vT6Mn3lU9s+G6IHRZcVJrw+avUnoIdNjBY8X/UYI52WVvEsBS9J
	C8+NPUxHWuEgr4Rp1cBHmGc+OsR8IFDrsdu7ipLxew8rvtpLt/U6A7DfyThYck67SnBnJSoaA9pyn
	DcMP7phvAab47QjRdyGpnTdGeTRlflGVaa/bFBeFWk6F0Wkoovr0OwAhAPx9/4CJopLrwvUvEPDHC
	hV5eY17/S372Mg3czz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95Z-0000000DQHw-1N2J;
	Thu, 19 Nov 2026 20:50:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95V-0000000DQGz-1scu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:50:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC98F626F9;
	Thu, 19 Nov 2026 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C521F000CA;
	Thu, 19 Nov 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121432;
	bh=/nxwbLVlzw8b/oIml8BsGvUkwKG9+QxjgDCbUHFmmjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QARB3Y4j9Q7Bdl+OONOWr+6OZSuKVIPU3QC/yxZg1thIOPdQ4Ni+m7XMz8M4PIrtH
	 sBZBaTwO95czJNYeOBfXqeNsn5iKGTTvRvelE6IZ8+MawntnntZDWzPmEe+IPzTbxG
	 C3hM4HchQjh8yjwezWXNVbERFHa5Nvz5mexV20RWDC7/o+HoMB5KZy6Jhg64JVg2Zo
	 bd4Wqgd3dCAYoFJU7eYrQZbWde+nny+PnTgYNcFY6rdJ04DCzhDDGSYXpxXuYGbqoz
	 RL3JaSbRA914jBFe9W+az/lecbLyMsknWPbR2lADj6xeCO3evY7773dvmVTl+07oAD
	 7dt19MkGdZrUQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 02/12] pinctrl: nuvoton: ma35: Prevent out-of-bounds write in ma35_pinctrl_get_soc_data()
Date: Thu, 19 Nov 2026 20:48:58 +0000
Message-ID: <20261119205013.2563811-3-lee@kernel.org>
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

v1 => v2: No changes

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index bfa743db8b13..aff2212c6278 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -622,6 +622,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
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
2.56.1.750.gf70dc682cf-goog


