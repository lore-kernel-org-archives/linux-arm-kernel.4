Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i+G2cAPV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DjTJLgA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=33WJWI75AX3YWacDJW2bzE3Ity7fXYUwNoTbBEoJL7o=; b=i+G2cAPVsp/9LOF97oVYQgILAM
	cbIWr9N/zfoPGQcGm//8NvCpuyVlRz9pBnLW4gLNJlGj+LtIBuw4xNnRuGfPXe6GFkVm9ir3Rw3Op
	znJOnhjuP7gRLLtVxvVsqXTkkP2ttMr1A5WswGIS2Ra+ONt2SVACAnsNfOuvMhbRMIbh48ZAUxEGk
	4im6OOSiBzF1VZu2Cd7eBUygfMprt4EQnYoJI84Elc95VjixSSt36KUVgiNRWcE3XbFzerqKvcgCy
	0wyV4a/MRt8zMhAsocuLaNehH8qBWYW9AxkC+O7ThyaZbrjrOXpfSjuYYazwSn2nugdTXOsAveXAi
	dTAw0Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxSN-00000005ODy-3q6N;
	Wed, 11 Nov 2026 01:48:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxSM-00000005ODp-1Mqr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:48:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 628E762FB7;
	Wed, 11 Nov 2026 01:48:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794361737;
	b=hxtEcRMm67qDgcXRy2hBozdOR2rsbnOQB2qgXMmdo01UOckobD8Iesw9tF1YrELVYYHi
	 6bRTFDsN1j/2G+3FMWmYb5fS+OSG7fTiY9epYO2/NeK/2iriLasz9ZGfYdfgrtzURrrSQ
	 Wy5PBVztrEZXg8m7YPB3buuKQ7QBOtUKEVtHOXOX/YRMzkC3gf+EoE5xfvNn15CJkdraE
	 wy7fhgA4uu9t8mfEProJphrGCNsu/x9BDZ6GBx8Qn60BTRuJbHuDAc0Po0liZdg+lil1i
	 cfpimW33BJNekRTza0YDaFt3AB3YiAicv6EafHIbZPuuAV8kdvvrI2I1e5G/yvUqRoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794361737;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=33WJWI75AX3YWacDJW2bzE3Ity7fXYUwNoTbBEoJL7o=;
	b=SqIpMUmN5Ubt6KB/SfTbWMCEhQdNZzzu2eG+HX0QqMZsc1ppRhn0TcMVBLzOUN/7OuP/
	 0sU8q+Jh+1ufSdFNucFuQ9lgqmAMiLcJtw/1uAdccNWev7ru2MbkP0OOrcN8Kn2uK/Cag
	 70dfzE7XdIKZt+UV0iNRj7R8NLcwbiw9LyulzXbf3J511PgthkhqSLmTYcaddQhXH70bW
	 aVEy7M3ED7tns3bI4Tf/5ifjeKCYKFp6ZLko9CxZ8BdlIexjwv7XwJmqWpQQ32qFvGd1a
	 +foGsTBAwWX0JEBSOPfRd380OIxeEYYi91QTMgHD2a1/yNM5qvRYRxcZft34n6G1Ykw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 736EE1F0089F;
	Wed, 11 Nov 2026 01:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794361737;
	bh=33WJWI75AX3YWacDJW2bzE3Ity7fXYUwNoTbBEoJL7o=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DjTJLgA+2iwpvBYpTUDBD8zNvU2wvqJXS/8sUN/RG9gpKEtn2V07wIWJde4n4h+/r
	 HpmeNQDVyBi2DnnnpYnBNER2YJ7NYbE1/xLoQmP4mS2BN8q1XOH88PpOK0aLXfQ1gZ
	 yW+U4Tr6FGz9aZ78FkV21uZc+fjoaKU0jNzigtVPswkh5ZQufxRSlMUxn4fo4tpSmN
	 rUc+Fu8lMx80Wx7PtHLdzkDhTDhsaMPxEFO33cmSJJP0ELipU7rL6S0qlqKw+nEHn9
	 ZrP9v4D69+yCDgWFZBaCFMwQLGXmoIUwyo2l5Ha5p/PSIs240qyR4ADjESfSjs6eKr
	 AjVxbwHQ0i9DQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DFEBF48D0B;
	Wed, 11 Nov 2026 01:48:55 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+charjenkins.tesla.com@kernel.org>
Date: Tue, 10 Nov 2026 17:48:05 -0800
Subject: [PATCH] scsi: ufs: exynos: Access HCI regs only while core_clk is
 enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-ufs_exynos_hci_order-v1-1-ce3cf68a74d5@tesla.com>
X-B4-Tracking: v=1; b=H4sIAFTJ82oC/yXMyw6CMBBG4Vchs7ZJC95fhZgGyl8ZF62ZEYIhv
 LtVl9/inJUUwlC6VisJZlbOqcDtKgpjl+4wPBRTbeujc86aKarH8k5Z/RjYZxkgxqK79GfbHOL
 +RCV9CiIvv217+1un/oHw+r5o2z7Z+44JeAAAAA==
X-Change-ID: 20261110-ufs_exynos_hci_order-0ea9b8035f47
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charjenkins@tesla.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794361735; l=2641;
 i=charjenkins@tesla.com; s=20261111; h=from:subject:message-id;
 bh=LAh4uxWJEJlM8NfNlEbxljfVuT2qoU7HqStq10W2Hns=;
 b=haIPNM/jxHhhj/GSLWYwPRTnUfCL/f3zCVGefXGiNVccdK//pUwTS3Lc0hUuzWhloFIVkRzL2
 GZ1rf3a9tJkDF7Dr5ZTJtqe18buZ0G92aaoVtxpEGl/wjADim/B72k5
X-Developer-Key: i=charjenkins@tesla.com; a=ed25519;
 pk=UcHY2MxMlGrG4OWEpbHAPZ2iB7xhVAktL8U7+7y1MhU=
X-Endpoint-Received: by B4 Relay for charjenkins@tesla.com/20261111 with
 auth_id=1484
X-Original-From: Charlie Jenkins <charjenkins@tesla.com>
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
Reply-To: charjenkins@tesla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Charlie Jenkins <charjenkins@tesla.com>

The current clock setup attempts to program the HCI clock-stop registers
after the core clock has already been brought down. With this ordering
on a reboot, the HCI bus clock is stopped before the clock-stop
accesses, triggering an SError on the power-down path.

SError Interrupt on CPU5, code 0x00000000bf000002 -- SError
pc : readl+0x4/0x18
lr : hci_readl.isra.0+0x14/0x20
Kernel panic - not syncing: Asynchronous SError Interrupt
Call trace:
 readl+0x4/0x18
 exynos_ufs_ctrl_clkstop+0x30/0xac
 exynos_ufs_setup_clocks+0x8c/0xa4
 ufshcd_setup_clocks+0x1c8/0x2a0
 ufshcd_suspend+0x4c/0xa8
 ufshcd_wl_shutdown+0x88/0xd4
 device_shutdown+0x158/0x1d8
 kernel_restart_prepare+0x40/0x4c
 kernel_restart+0x20/0x88
 __do_sys_reboot+0x198/0x218

This is visible on FSD, where the CMU gates are in manual mode so
disabling core_clk really stops the clock.

Ungate in POST_CHANGE when turning clocks on and gate in PRE_CHANGE
when turning them off, so the HCI registers are only accessed while
core_clk is running.

Fixes: 91c49e7e82d7 ("scsi: ufs: ufs-exynos: Add setup_clocks callback")
Signed-off-by: Charlie Jenkins <charjenkins@tesla.com>
---
Found on a Tesla FSD board.
---
 drivers/ufs/host/ufs-exynos.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3bcbc9ebbb283..d2a79ebf193e3 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1116,11 +1116,11 @@ static int exynos_ufs_setup_clocks(struct ufs_hba *hba, bool on,
 	if (!ufs)
 		return 0;
 
-	if (on && status == PRE_CHANGE) {
+	if (on && status == POST_CHANGE) {
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
-	} else if (!on && status == POST_CHANGE) {
+	} else if (!on && status == PRE_CHANGE) {
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_enable_auto_ctrl_hcc(ufs);
@@ -1139,7 +1139,9 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+	if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
+		exynos_ufs_disable_auto_ctrl_hcc(ufs);
+	exynos_ufs_ungate_clks(ufs);
 
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);

---
base-commit: e550f2b2b4aab4c5f12db89d04d8978ce4ed7b4e
change-id: 20261110-ufs_exynos_hci_order-0ea9b8035f47

Best regards,
--  
Charlie Jenkins <charjenkins@tesla.com>



