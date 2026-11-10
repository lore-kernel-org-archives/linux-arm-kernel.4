Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rm8VkUXV;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=NvrgIMMt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8/IWgraaFSnxdS84ExstKXMYyxJKiP3P4ywpY9iliXQ=; b=Rm8VkUXVf4v9auGOKoy7q/ikph
	fe+euVGInK5Tr4GKgyc2xLEtWY3fYPunHqfU0jamQnmRJTTAcodQsFbkCy2OHjAuCkJzmgZlwiWqU
	ntuwLBjXV6i4zC3mb15sO30A1CeiGWdiaGVBX6RU1VHiZmAFrbQyCj7nYmPAkE3Ro5Dw/rHccU0pj
	QfD4l2Gd4ZFWrN1XPBtPKyFzjW03aAdlQfHaekKLFxeHgFZFS7wQ4eqpOdeI3RZwpB6GRWza2aOOX
	BaX28/3Wcnnfw6AIeDtKOrmicl/uHrBZO2V+j8mLGW2ZfOJu/gBU4qI/qcqRE/rXfLLlE7Sjzygwy
	1fhzkDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtCo-000000052aX-0zHR;
	Tue, 10 Nov 2026 21:16:38 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtCm-000000052a1-360J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8/IWgraaFSnxdS84ExstKXMYyxJKiP3P4ywpY9iliXQ=; t=1794345396; x=1795554996; 
	b=NvrgIMMtKoNDhSBESg3LendEKJ/mdyrByuJ+1+jO4yPmeVxjYIffImjt/YG/wg3DbIeTNTI3dFk
	oPeLQrD2kbxK/42Hb2Ri+IKHsT0TqtAp3NreoGBQMGKQZ//0BsmA46eaSLe07OLC4yBVBI9aTh4KI
	l3hIq8g0JL68xOYQyv3QZcnePRnhqgGkJtx6N0hgphbwy9EqPqxR8CjH7F2SJN/Cs6XHi8TVRzUNt
	5VLRpLH7OZpGiwX9LhRNKOYimUkaOvUhsrS6A3OBVeKWw0ZUJwPFJqL4zGRjQf4pOI3HJ2VkUB6Yf
	SldhXo75U7fdcRZk3+PWcIAnPe0ApXgf4ADw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	andi.shyti@kernel.org,
	thomas.richard@bootlin.com,
	wsa+renesas@sang-engineering.com,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ARM: OMAP2+: fix omap_device with noirq_suspend
Date: Tue, 10 Nov 2026 22:15:31 +0100
Message-ID: <20261110211531.679943-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_131636_783706_1D2B11E8 
X-CRM114-Status: GOOD (  12.81  )
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

Fixes cases where device runtime gets resumed in _suspend but then
pm_runtime_force_suspend is used.  So the device is disabled, but runtime
active in _noirq_suspend leading to duplicate runtime_suspend calls. So
rather check for the device state directly to indicate if changes are
needed.
This relies on pm_runtime_force_resume being used in a balanced way.

Fixes: 7da7fd7e66ac9 ("i2c: omap: wakeup the controller during suspend() callback")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
This really needs intensive scrutiny but might be a less invasive patch
solution better suited for stable and paves the way to get out of the
omap_device theatre without too much hurry.

 arch/arm/mach-omap2/omap_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 77a75b0b9ae69..52afc9089a5a0 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -393,7 +393,7 @@ static int _od_suspend_noirq(struct device *dev)
 
 	ret = pm_generic_suspend_noirq(dev);
 
-	if (!ret && !pm_runtime_status_suspended(dev)) {
+	if (!ret && (od->_state == OMAP_DEVICE_STATE_ENABLED)) {
 		if (pm_generic_runtime_suspend(dev) == 0) {
 			omap_device_idle(pdev);
 			od->flags |= OMAP_DEVICE_SUSPENDED;
-- 
2.47.3


