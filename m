Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B370606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UeEYInkV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=IFFVSli/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hAko9zGkmi9niJtZOL71kVVVwwbmLc2t5MHh5r5eE0o=; b=UeEYInkVI4K4xY
	3jbd0nlI6rwH15GOdzlad+DWoUQyFDC8ion5khmN9At6jvOURwspq8o+meYmlFIFuS7Xxkjy7FrG/
	PGWPl6IkMRA/ETNWksuK/KT8Om/zn2QCTDUHY24zCQRUiEJq7U/maduvrDSdZs9D3S1GYlnPf+8MR
	qS344hA9pOUqUrXWsVTERZxc+0Z/qCQcnJCu/VIF+tD62rD5cQN5ZtEVtbF97xQN3JiMTknWzkeqR
	1HdYwuBxvG6C3x+N5ar1zBUs0HiQV8v9aR0vEhlJHUS3eg13jx2u6eGNV5JKELREmqfOA+F0OrnMh
	V55pWrVBSVBRvkYzUwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWHS-00000001gHl-3xN8;
	Mon, 09 Nov 2026 20:47:54 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWHN-00000001gG4-17jB;
	Mon, 09 Nov 2026 20:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794257262; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=E98HJo4M9xbxdr894U55ndlMxcGrMXf4IZiUI2186xilrWWrK+VG5p6micoS1kwGVPTtS1zJ9bY8NWcxbw3wI2SNFk4sc55tc07qaWYSLlrW+hKrtLnW3dNtBxR7zfyEKqJDFRYw/Oar7zOV6kut8Zb1sp8rAhaSV7vkK3LIXNc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794257262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hAko9zGkmi9niJtZOL71kVVVwwbmLc2t5MHh5r5eE0o=; 
	b=LyaXY6Obyfmz9ip0+Slx4XjSlVg8teruIXtc4tnbM9WBqTXeFsQoIolV7T85UOvBFFBIzSldbXnO1ia1qbFxL7mwI2RGQAtFsvLKuuUaDncb/cgsWOXPmjoBuejRtnUgMzj4FYVO2ArARKNqpCBPIOrfXaCqF7vmjfmFF3TTlVI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=IFFVSli/fpGgICQj52Xp3TckmHGAzWCHrwGBi2PqqOm2PEHLoPZqCOCANftleC+kptSgcc0ElcHEuqoJIhlT5DN4piVmO0yIxB7SYiLNjUkn9LegPLlZu3GLs7sjAwhO39SYvwRc3IfyGYAbvT0fwrev/fZ+l4+aqp3IOrnCF7U=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=hAko9zGkmi9niJtZOL71kVVVwwbmLc2t5MHh5r5eE0o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794257260723543.4215096609604;
	Mon, 9 Nov 2026 21:47:40 +0100 (CET)
Date: Mon, 09 Nov 2026 22:47:39 +0200
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
Message-ID: <20261109204122.async-probe-reply@iav.lv>
In-Reply-To: <20261109202202.GA265423@bhelgaas>
References: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
 <20261109202202.GA265423@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_124749_580129_407D8962 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, Nov 09, 2026 at 02:22:02PM -0600, Bjorn Helgaas wrote:
> I don't know what the SD card has to do with PCIe.  Seems like there's
> some SD issue, and making PCIe async happens to avoid it?  Sounds
> fragile to me.
>
> Other changes like c0e1eb441b1d justify it by allowing other drivers
> to load in parallel to reduce boot time, which is a good reason.  But
> apparently here it makes a functional difference as well, which feels
> sketchy.  E.g., what other drivers need to use async probe to avoid
> similar issues?

You're right that the real problem is ordering: nothing makes dw_mmc wait
for the RK3399 io-domain driver, which sets the 1.8 V level of the SD
pins. [1] tried to add that dependency and was not merged. Async probe
only stops this driver from holding the deferred-probe worker for ~0.7 s;
any other slow probe in that window breaks UHS the same way.

Is there a way to express this dependency that you would accept?

[1] https://lore.kernel.org/all/20230904115816.1237684-1-s.hauer@pengutronix.de/

--
Igor Velkov

