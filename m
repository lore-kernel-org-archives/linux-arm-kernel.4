Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE52606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ARl3vdgB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=FQDp3X/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O7bVopwx5l+uCFIzzBjwy3PVWjV8Mb7Aip9Q8J+MAmo=; b=ARl3vdgBqz+9iG
	m0hlRbcw4GhlxoMiUNv/AOhTgZ/YupGVEWQvGThIR5KrnLx72VNz2ntBQ7JEw1RNjPvD6WmyunefI
	ynj+RRezcgqN5FNNF/eAekmkVk2+H+wjjAYySVgdy70NQU0Nn5FIENDklGWSGzLdcyR/043O4XIVl
	ccbbdPnjiKasAacTLlYtbiiRnITFALUu9WMNmxhEHlTS4VJ8YqiSVT8PeykMsirCkeco7fCEGw0vB
	AyZGxfJtruV7Uw67eNSyjOE/MP/Y/S9MA949JV0LioFpKvG36i7hpil78JcrXMXqA75KrrLzQG1G7
	NnS5/HK7Xh5ql7xnDlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPVR3-0000000E2HC-3c7x;
	Sat, 07 Nov 2026 01:41:37 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPVQz-0000000E2G1-35gS;
	Sat, 07 Nov 2026 01:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794015689; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=e2brhpj8A9dBddC81FdSHTW3MCxt7B+/xYvr6ca1LF4quscdSbf16uaMwrNW6C2O7vstBEmKvlImC9Y35OVty3HdeOA9tASC3hV8oBTxFdg2cHV/Ip4MitEhRfeh9C8TM0xrI8/Qhy4gMKaEoj0jzU4lgX8aOBhc5zJr+ZtP9eY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794015689; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O7bVopwx5l+uCFIzzBjwy3PVWjV8Mb7Aip9Q8J+MAmo=; 
	b=gIvGKe0VQsrISA1gbb7Nn+G7DE/JZzRjii8z8J77rXmAVMeGyus8xjsjHH3QL2e8MMrOGCx02jxyQd8aLQmS+t3r9qKIdgVDt7ahJ3aHp3XX+2eHK370cNFo+zkiJ8tX2Shw75eXyoUs20UAZmdD4UAkQgJ1vQibWY4VPF0uDp0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=FQDp3X/1HdXeZbvwM0b9ecMMEycmE6OoWSIP5e+Zf4wX90iH205lsZCeaWOOaC+y/Nhn50RbR9KHJEDcJwEm9kex7gOj1/OjJAXJ6wxOQ26mJTMhVrsmQWoF94znQdgWAIRNn0EI/QQJ88KbfomPWP8Vy5eAWUJyutsIpXyJeZ0=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=O7bVopwx5l+uCFIzzBjwy3PVWjV8Mb7Aip9Q8J+MAmo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794015686878202.4386126026909;
	Sat, 7 Nov 2026 02:41:26 +0100 (CET)
Date: Sat, 07 Nov 2026 03:41:24 +0200
From: Igor Velkov <iav@iav.lv>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: iav@iav.lv, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v9 0/9] PCI: dw-rockchip: add system suspend support
Message-ID: <20261107-dw-rockchip-suspend-v9-tested-by-1@iav.lv>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_174134_067138_A762D035 
X-CRM114-Status: UNSURE (   4.15  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on ODROID-M1 (RK3568, NVMe on pcie3x2) with 7.3.3, Jonas'
EHCI/OHCI clock patch and f845c1e2d2d4 ("PCI: dwc: Add suspend_poweroff
flag for platforms with RC power loss") backported: s2idle 10/10,
deep 10/10, the NVMe stays usable after resume.

Tested-by: Igor Velkov <iav@iav.lv>

