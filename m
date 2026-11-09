Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMEt13GP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Fu4LFQih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b9nkg0bUgrEInPraZfEB6T4z0np0Vi/eCDyRJD4LyDU=; b=rMEt13GPK4RgVU
	EMyFVRCsxJUEDfiXZSMTQWIKz2zmmbGyspgAecBiA70dr0fHqgckMAJ4Ck8fodaGrycR+OaOpAgVX
	4sbJFYnUfCRvE0H5o/sQunpl3vpS+vP2RQZDTKlFdsvCzwbQku+KPJKQkIEZldCmNuT1oMAbbWpF+
	M1+qgQgTvSV5/V8pJQZSUubDoGe5o25MIlbeBDyvqaqbbWd76yAHtSaWAlaDheGBdWHJu3OIMsC0z
	GbRDbDMbxcYguXlD8CFde4bKto7klMn0HhfKnAp0Oq4285iRtmQOKxAApVOUwoW+kh8QtKpwStp2d
	uTKHYHMy/LOAzsfL8Z1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWaZ-00000001jQG-1Iia;
	Mon, 09 Nov 2026 21:07:39 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWaT-00000001jPO-48gz;
	Mon, 09 Nov 2026 21:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794258449; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jz2EsnWewn02NaUWxMIIzv828qC5NmQF/a2pqF9dSuaxddqeIKD/4RwjQk1/dM4/VC0lJnVWV13dIoUXcnt3l5w7dSWKjJ0O0AsMFmXuw7IQoHl7RE8RkYK+FzuBRejjkX6hKR3Ho2UN4bPKKPVy411FJRJHZNnVcKJ/pyOBEtM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794258449; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b9nkg0bUgrEInPraZfEB6T4z0np0Vi/eCDyRJD4LyDU=; 
	b=G9aE4h3l/2wbrIFodBIzxz2en43ztWTrsGsATJTLYJfStp9Eb+yVqztWXk0X6M1RL2eaImEUXszjnHCjT25CCUsRv3zRwniR2nuLRBS8UqgSO4ZLewdROsXJMs7dCYKlslBcNTRAOpFG9VOyW2TueyFF54IJFJNfptKKc6QL6lA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Fu4LFQihBYem2cDlZ7W70Wp7j+nPLzwfZ/1NsdCJZtStypacGZSEjrXauIIvlMpdmXQax/DbjmAsokRpC2SPkDBpmn6hWmp9xWQXD32+DCxav/lVABVjXTaLar3ojHTNzndmPh091NJB1P2I5AE4+JXZPWcDE5X8xT2eriAKMHc=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=b9nkg0bUgrEInPraZfEB6T4z0np0Vi/eCDyRJD4LyDU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794258448226804.6244202787284;
	Mon, 9 Nov 2026 22:07:28 +0100 (CET)
Date: Mon, 09 Nov 2026 23:07:27 +0200
From: Igor Velkov <iav@iav.lv>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] PCI: rockchip-host: Enable async probe by default
Message-ID: <20261109210800.async-probe-reply-2@iav.lv>
In-Reply-To: <20261109205911.GA292554@bhelgaas>
References: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
 <20261109202202.GA265423@bhelgaas>
 <20261109204122.async-probe-reply@iav.lv>
 <20261109205911.GA292554@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_130734_683102_8782C0A6 
X-CRM114-Status: UNSURE (   9.14  )
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

On Mon, Nov 09, 2026 at 02:59:11PM -0600, Bjorn Helgaas wrote:
> Mani's already applied it, so I think it's fine.  I'm just trying to
> understand the commit message and figure out what the merge commit log
> and the eventual pull request should say.  It sounds like "this makes
> SD cards work better" is somehow part of it, but it just feels kind of
> hand-wavey.

For the merge log, maybe: "Probe rockchip-host asynchronously so link
training on an empty slot doesn't stall other drivers' probes for
~0.7 s". The SD card is just where we noticed the stall.

--
Igor Velkov

