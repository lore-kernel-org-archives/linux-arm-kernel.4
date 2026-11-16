Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3528606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0MbmoF3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=MS7o8GTI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p8qohISl+WTz9/d4v1QRbzQmTV1sBrjKLOynJ9T91A8=; b=S0MbmoF3XXDQNx
	ERSRz+YeW+eikbvdz6BDtMM4rYAODWV++IhTlUgO0XCzztVRqxihROxdo4+E9f5dL5ib6ia+U20Oc
	1rKUn5W2/PNGPOCXAeeshnQULF6uVj0eGFl+BGcNVjJeeShSHz7tKl/kCzeLPLhzR24TXj8fT6N/g
	zzyTYdiFWBcPkiJRvqot2NTbmLgJu8hYhTRiVm4cduAU83Ommo8ww5RuixP7zKfsHESUHexDP3Iai
	HUbaiwabDEIETrLbQMBGIOeQhhXbZ98xtqNiuvuySLmU/uFgKDBXdvLeEFHyPRkqyjxjmOAxmzLcJ
	tybLYNRx6cV71r28GKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT25l-00000003iiq-12ic;
	Mon, 16 Nov 2026 19:10:13 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT25i-00000003ihe-1LRA;
	Mon, 16 Nov 2026 19:10:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794856203; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=eE6wGEZKwQIhKmc6ZsU4bjMarp1T+8g3NmGQkul/B71UYk10PUB0USRDH7LHRnp0AWEUGaupiYUx2URyD+Z+VXoR+bA/esepiKnmGebGaJk0NANNfQMUvHDNHTrUHN7kXyjOtAVbA1KcqyM/PKAY+8aVC7tY64/aYPtzec3+mds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794856203; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p8qohISl+WTz9/d4v1QRbzQmTV1sBrjKLOynJ9T91A8=; 
	b=N6mTP6mda6Tfe3INR4Mx3Dagd0GU7SrIja92BNfLdMLWWC8ifggS/npHs5wkgSrpbiY6qY8G4PuDFUNNNksgMuxLK/rFC66jTh3H2VN8LSYFeU4quPJlnCVXVWSx3wHGTCUWQ044DYr0I2SdHJnt6fCkiMXa5HMfrzzR5IzbDEI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=MS7o8GTIQI3HoIALL732EwV6YzEfTOFPhh+cEZ8rkn2U/1/LYMQlFAdtEwVrXA7lUQBokPhIJ7j5IfB8O/OV8+MkmvpwuMMAFYTEokXVIp4NZOdtUdfbhTF4xKFuKEn3zAt9vrBSziqNKiXr+6uJsjejOduL+lMiXVQkxbiEjJM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=p8qohISl+WTz9/d4v1QRbzQmTV1sBrjKLOynJ9T91A8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794856202137794.1410024266912;
	Mon, 16 Nov 2026 20:10:02 +0100 (CET)
Date: Mon, 16 Nov 2026 21:10:00 +0200
From: Igor Velkov <iav@iav.lv>
To: Matt Thompson <matt@boondocker.io>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC v3 0/6] PCI: rockchip-host: Handle unavailable downstream config space
In-Reply-To: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
References: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
Message-ID: <20261116-rockchip-host-rfc-v3-test-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_111010_495960_BF474569 
X-CRM114-Status: UNSURE (   6.11  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Helios64 (RK3399 + JMB585, x2), v7.4-rc2, 150 unbind/bind cycles,
alternating A53/A72:

- v3 only: JMB585 lost 5/150 - 3 SError panics on A72
  (rockchip_pcie_rd_conf+0xd8), 1 fixup on A53 (no panic, device gone),
  1 gen1 training timeout.
- v3 + my retry patch [1]: 0/150 lost (2 bad bring-ups, both recovered
  by one retry), no fixup hits; s2idle 20/20.

As with v2, the fixup saves A53 from the panic but not the device, and
does not catch the A72 SError. Patches 4/6 and 5/6 were not exercised.

[1] https://lore.kernel.org/r/20261116-rockchip-pcie-resume-v2-1-a633e279be97@iav.lv

--
Igor Velkov

