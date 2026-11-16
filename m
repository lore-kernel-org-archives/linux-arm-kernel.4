Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5454606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v049hJA2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBf6sB8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FLhuEFH3u+k6FetUP317BLmCtrtrwaFzt7hnqpVTcNI=; b=v049hJA2MqTMZlUoLzeyUImCs0
	RD4D0ur3m6Lt0ttLJTLNVNuV/Lho1nfxCYhE6Ga74HGy80SM68JFShr7xXIFWbI1Pl4Q+kNINh9Rc
	bKWfSqNF9s7fx9gu00vSWEo1SB26CHUyR+idJxZ263dyWICVRwHXxamwKdzFyH+ly4d3EYM2R935V
	lrsxRAwkcS3jQio13Hb+wPKjlMFqbv3MnW7a/yv2vyWA7+SpRq/8n/wDeQYOSNfKA2p9pp8baWwmG
	8+9wEoIco5dppIfxNnGBfWx8s0Jr5wk3w3ThICDzH0LJoGnqc9MdEYhfvZUucsGtUXu/FiumBsw8K
	jMlxgT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt7u-00000001nHI-2wiT;
	Mon, 16 Nov 2026 09:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt7s-00000001nD1-0uEe;
	Mon, 16 Nov 2026 09:35:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6C58627EF;
	Mon, 16 Nov 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794821747;
	b=aR3Ei0qucouuKHzeSJJ0SIRNoS/s7eGbulWfBfUhgkSnqyczTLeSnCWYi6boW4QWR0lb
	 MJqgdRP6fFqXKB3wAucIS7T6LiKnSGgHmQwE+ElpUPt7URTpX8yz+6KE341KoIRYkuyIP
	 H4wcRRXWpVBBiMcMmNrrE9ndFOIuQFBSnHo2Cmp2tUsCebd07whIle3XNXI8KaMRV92Ht
	 hs7519OyiR73vJLyRInu5ruIOnXW1ytrRyBiZbfTVwFHzyDPQfzcqx25oVisIsmH/UfNf
	 yjVrK34RIBHYEDfTzpkQZ9JSKsyqlT+e5FkfjdPYOLZMOjRFF2US7xZjC3+9NrSxsgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794821747;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FLhuEFH3u+k6FetUP317BLmCtrtrwaFzt7hnqpVTcNI=;
	b=BItLXPlhBZ94lX/elvWCbzuYadcNfVUXEdoAMcOLw+zmt7p/5kq9AnqQNnr1CO8To/3h
	 +QJfUALBca1JMuuGGY5DmITTWIGdpRGa0yete0S1YqXpUaghtArTuPHjO+ZxpbH9N09ZX
	 EylwS6KPZ9AjK/oy5gGC2YlrQ2F6k44J8QoSHcTnK9e2N3EfaiTXNqzBuYKpP2BKZxm/X
	 8GnyYJHDRX4qMPqMQJeuXW+cK/Zrjz9ZdMox4ths+EfC2Bk2aPFOl+j1CWDbgMpm6H3GB
	 LtGHDX1rRGjPP1gLOvjuWQUczcc8FhVP6563MZNpXWt7Mvfmmfb3iIEh7n0wcn7stOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06A0E1F000C8;
	Mon, 16 Nov 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794821747;
	bh=FLhuEFH3u+k6FetUP317BLmCtrtrwaFzt7hnqpVTcNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OBf6sB8Ndp+/S3rauQQtJOIn77dIy4O6p8GSzveNa+ZrVWDlRJtRV997fPVb+MPm+
	 3SSw/00769EVbkLHDmM/khL+Ghw8zrKx0kVhMo5cK+0MTbPGvNGuSB6U9PXcjzgTyF
	 gnb76vVfCEiuhp9qzbh8YiWPBcQyATvvg0UQDj3Gh6auG80qpGvJ6A72Bx0BI2vzrz
	 O/83w0pckehs/UZoH5gBmzPCvcMcgdXaSg/QmHffM+lU2kYLXb/7KLG6QibaA9CPOi
	 JSrXrW4qn9QD/BmgGgUUf0HhINV+KLqt8b84xEbUFddIHVwdpnY9RQzH33KAyiaRJT
	 csLczZjDv4AZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 881664A40A;
	Mon, 16 Nov 2026 09:35:45 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Mon, 16 Nov 2026 02:35:46 -0700
Subject: [PATCH RFC v3 4/6] PCI: Resume downstream ports before sysfs Link
 Control writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-rfc-b4-v3-4-0bf052b68f2a@boondocker.io>
References: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
In-Reply-To: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794821744; l=1870;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=WwxhOpFrtKsCRMga9k7eAPDdOyaWOUhvS24ZacGcwHM=;
 b=Vt/YxUV8iyuFcHYDbGV8VJ1jDUfHBt7r3E0+peNj47PQhLuHZVbc/DW+gkn2Gb1zSm98duTUN
 ShveA0x/eUaAq51euaX34+7tof+wu4vc4pOXXy7r4ZsVWOwU7sG1VR/
X-Developer-Key: i=matt@boondocker.io; a=ed25519;
 pk=WMnh3kwFFRkrqamL/FbDcdl1/9rBF2uT03VdvGGP40k=
X-Endpoint-Received: by B4 Relay for matt@boondocker.io/rk3399-rfc-20261113
 with auth_id=1517
X-Original-From: Matt Thompson <matt@boondocker.io>
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
Reply-To: matt@boondocker.io
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matt Thompson <matt@boondocker.io>

Configuration space can remain accessible while a port is runtime
suspended. A sysfs Link Control write can then reach hardware before
runtime resume restores the saved state. On RockPro64 a rescan resumed
the port and restored the saved Link Disable bit after userspace had
cleared it, leaving the endpoint absent.

Resume a runtime-suspended downstream port before writing overlapping
Link Control bytes. The configuration access already holds the runtime
PM reference across the write.

Signed-off-by: Matt Thompson <matt@boondocker.io>
---
 drivers/pci/pci-sysfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6669e9a..ff47ea1 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -786,6 +786,7 @@ static ssize_t pci_write_config(struct file *filp, struct kobject *kobj,
 	struct pci_dev *dev = to_pci_dev(kobj_to_dev(kobj));
 	unsigned int size = count;
 	loff_t init_off = off;
+	loff_t lnkctl = pci_pcie_cap(dev) + PCI_EXP_LNKCTL;
 	u8 *data = (u8 *) buf;
 	int ret;
 
@@ -809,6 +810,21 @@ static ssize_t pci_write_config(struct file *filp, struct kobject *kobj,
 
 	pci_config_pm_runtime_get(dev);
 
+	/*
+	 * Link Control can be written while config space remains accessible in
+	 * runtime suspend. Restore saved state first so a later resume cannot
+	 * replace the new link setting with the saved value.
+	 */
+	if (count && pci_is_pcie(dev) && pcie_downstream_port(dev) &&
+	    pm_runtime_suspended(&dev->dev) &&
+	    off < lnkctl + sizeof(u16) && off + count > lnkctl) {
+		ret = pm_runtime_resume(&dev->dev);
+		if (ret < 0) {
+			pci_config_pm_runtime_put(dev);
+			return ret;
+		}
+	}
+
 	if ((off & 1) && size) {
 		pci_user_write_config_byte(dev, off, data[off - init_off]);
 		off++;

-- 
Git-155)



