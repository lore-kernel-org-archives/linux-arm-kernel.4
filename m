Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 06:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sHpe5wlb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=DfBt5dy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DE8O97+cLTb2fOL+TR06WyWM36lYsEezlYTIeuQx1X4=; b=sHpe5wlbXxD0vE
	ms+JxVKE9Mv8mSy0/RgXAeSsK3Hx1+6RJ3h7SZKQWUYF9f4WCLyCvuxtijwJAZMT5elUT4zDuv2Bb
	du8vIvuobfYzGr7g0zryy5a6rB/Lk/X51TywjBuMjj0qh1REmyy4/zpu/yRSxYwO/IU2ElUnPzf/B
	EbIQKTjVeyd6TEXGTmJQe3kjyw1gMWpWdnrZViFq9ap3HkgwmSY6BgEfT/Z8ryJODjD6+MNP2QfGL
	5vdb9WKAiBUkHG8Kh+Sybkqq5uEodANesBkmyanKwgFIzHzGzLhHsQHNAzL2hX7liqCB3thrko4Gh
	ByRRP8TV04ykmxuMdJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvYo-0000000Azb5-0693;
	Thu, 19 Nov 2026 06:23:54 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvYk-0000000Aza9-3p4L;
	Thu, 19 Nov 2026 06:23:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795069423; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=dtRWGpjk7C/pH1f81J5merSCphSkEokQv/E8YaSkNF4k7a9/7qYEp8t960nhaVwg+eTDXlSYWuFXbK9poDVZSQuHwY4HPQka6PxrWpR6SXnzgNUgNc9+CRw/VHis4kjcQnF1/XE3tWxEBxkKCpJG7wNJCbGqlte/CRAyRQN5XD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795069423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DE8O97+cLTb2fOL+TR06WyWM36lYsEezlYTIeuQx1X4=; 
	b=Ie00+LxniYfy5vjl7DO1UNTBoLmgX48CSWYC8PwVqMag/G4TuzDxYbZVX3UdC4yXe6WbdVccTyBUKfuABcHwBMXrhsR9cqfmkg+vrJQfOASVX9d2pa9BTEH1K4qJIPQYo2XusckmACB+yY/B2X0mKNologMFCW2X2lWDOxcjthE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=DfBt5dy8/PibWVPur2s+Bn5rh5CwcSYwxqhCP3s2WuzOOGnnyNePpGxC8dPueCpaqaRGgaLLNBgI3gcnl8ldp5MxxHGROxl87QvNH5PzJWUaN504uu+fGlMI6HoCyn+YsQtkFoaDY5UzcJC5ZbWhx5FB9IEdYuPcIqa90BYiSRE=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=DE8O97+cLTb2fOL+TR06WyWM36lYsEezlYTIeuQx1X4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795069422691713.2242534782733;
	Thu, 19 Nov 2026 07:23:42 +0100 (CET)
Date: Thu, 19 Nov 2026 08:23:41 +0200
From: Igor Velkov <iav@iav.lv>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, iav@iav.lv
Subject: Re: [PATCH] PCI: rockchip-host: Support hibernation with endpoints in D0
Message-ID: <20261119-re-anand-rockchip-hib-rails@iav.lv>
In-Reply-To: <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com>
References: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv> <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_222351_229772_15C20F75 
X-CRM114-Status: UNSURE (   8.68  )
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

On Thu, 19 Nov 2026, Anand Moon wrote:
> It looks like we aren't disabling all the PCIe regulators (0.9V, 1.8V,
> 3.3V, and 12V)
> during suspend and re-enabling them during resume.
> Shouldn't we power down all of them on suspend and bring them back up on resume?

This patch keeps the rails as they are: suspend_noirq() already turns
off only vpcie0v9, and the other rails stay on from probe to remove.
The 3.3 V and 12 V rails power the endpoint; cutting them in suspend
loses the state that the PCI core and the endpoint driver expect to
keep in D3hot. Doing that would be a separate change.

--
Igor Velkov <iav@iav.lv>

