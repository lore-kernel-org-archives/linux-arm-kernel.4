Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4WL7VE/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HORGZmdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J17JCYsAcl5/cYYAOcnth4K16AHlbLTi33rlyjB7GJ8=; b=t4WL7VE/5ST0hB
	TnRR2XA0yAYPqFrKuxJIpIJQhqNac6PcWoC2OHL9quJM70ajUZAe81kq8smF/G+ORs3YeR2xpVS66
	tya7Evs1uSae4OyktZ6kPL3d6Qve0b1zpMeoGlSEjYlQLuINidJt7RG0F6y9/+YFXXVEs3LNVPmvf
	79ybxMI2St+NxpZoWc9GsnIqFfBbvCWXODobs0CPdl0iYS2bm0oDhw1t4EKphibblOIv1h6Fwicjg
	zi7zuz6I7e4FPhro8KRlOjqR5tObqvuXN9qQtgotOVMXmVaUEt4MJK41LnyIEQPCllkYm35WT985u
	T5qe1EjlA6i22SiKoENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Aq-0000000GLPa-3RZD;
	Sun, 08 Nov 2026 15:51:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ai-0000000GLIY-0m9f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9991C600D1;
	Sun,  8 Nov 2026 15:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B451F0089F;
	Sun,  8 Nov 2026 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153067;
	bh=J17JCYsAcl5/cYYAOcnth4K16AHlbLTi33rlyjB7GJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HORGZmdlXI4Bau+z4zXIcL+K5YwLC0nGj7wsVEcR9NxyRJnkEbbEUAvdoryEcrlmN
	 5jgr6gNooWL4lcErL3CRFCp4ljYOAypZWZt4ar63CM1Y4lXo/n8WemL3IOcnwe7m6m
	 7ArOcJXEYV9BptSln/DoxQfa9ZH4vyBAgk32btH+SPCYwKNVPud+J/VfOyKv6bzXYd
	 fft63YRMKc4rtLAxYbLzESTxNJib6l4pF1g9hd/w8CqLZa7cKDxwc7DUk2pp5aFi9u
	 C11aANivTvQevp2e7iMgLmsUxG5fkCX9QRoaBbSFMf8XSX7ry3FK9VJ8SjJIz2HsxT
	 aulmGybl0avNA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:02 +0100
Subject: [PATCH v2 06/15] ARM: configs: u8500: Enable IP routing and
 filtering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-6-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Enable advanced IPv4 routing support for U8500 systems used as network
endpoints and gateways.

Add SYN cookies and modular nftables connection tracking, filtering,
logging, rate limiting and NAT support for IPv4 and IPv6. Build TUN,
virtual Ethernet, bridging and VLAN support as modules for VPN and
container networking.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index d1cb4b76fa52..18a73cd7b03c 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -55,9 +55,25 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_SYN_COOKIES=y
+CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_NAT=m
+CONFIG_NF_TABLES=m
+CONFIG_NF_TABLES_INET=y
+CONFIG_NFT_CT=m
+CONFIG_NFT_LOG=m
+CONFIG_NFT_LIMIT=m
+CONFIG_NFT_MASQ=m
+CONFIG_NFT_NAT=m
+CONFIG_NFT_REJECT=m
+CONFIG_NFT_FIB_IPV4=m
+CONFIG_NFT_FIB_IPV6=m
+CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
 CONFIG_PHONET=y
 CONFIG_BT=y
 CONFIG_BT_HCIUART=m
@@ -85,6 +101,8 @@ CONFIG_BLK_DEV_DM=y
 CONFIG_DM_CRYPT=y
 CONFIG_DM_UEVENT=y
 CONFIG_NETDEVICES=y
+CONFIG_TUN=m
+CONFIG_VETH=m
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
 CONFIG_BRCMFMAC=m

-- 
2.56.0


