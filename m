Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c4hnRaO5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhzhEF87
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ohflwTIw+Y1tH/9jqyoPDqwznuFbRi/wcTKWRmCALvw=; b=c4hnRaO5LhMMKqGfihCP7vImC4
	nTTbGP68kfdDFOnq3LbUyEc4nnKm96FVXh9My17nNGCV4+6BRHcrtA4iRYicVtil2Ltsq3GXL49t6
	HZM5CN83cqKIvwS1dVlOoPZPBP3cIn9HxQ1DzBISXxW3x8+lVkBajxQ7wzGvGz5jWvhMNXGkOc5Fx
	69+UWEajGORYfMdXydazpcMeo/duydSDYDxZ75mKEtsTSTF1gihZKsg5+HoM1TtuP54m99SUHU4B9
	dWp3haVlWZDr320r4AHebbXqL4w23hpvI1OEuAzUZkiXA8tBSfF/8WGATPNAKWrdFrUuPUxhmePdA
	GhOfszOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8W7-0000000DKOt-0XOg;
	Thu, 19 Nov 2026 20:13:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8W6-0000000DKOl-139Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:13:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6013660D26;
	Thu, 19 Nov 2026 20:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8B41F000C0;
	Thu, 19 Nov 2026 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119237;
	bh=ohflwTIw+Y1tH/9jqyoPDqwznuFbRi/wcTKWRmCALvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhzhEF87IGe3TrNLOmhv16gsGf5lfuG+STVwpK5CqftHhPorjQKUxxSHqAjtItPWB
	 0abKTfoUZqNz/Cwf0DdRveogQxxuB4RIkh/GSZQWOi93Z4ot/YmpbCvxO/esCJy8FI
	 b4hC+z09jr7OJdQm9Bez6HfjW75l3lYBnbLF23V4Q+XFWaAaow6X6Uq4T8qCCsenNc
	 kwSIHlAt+fwq3xeFZraigJmho4grycYNxl8SZSO7p4BosbIMy1aZ1ElSvNEkNjPfxM
	 3x0CRqORhKH9wNJ2MvEG8zfl2H/KaEiA5VRAkbTcomeOXZ7KLsdlY7RhHwva0VXqRd
	 aGtLxIrPMjMZw==
Date: Thu, 19 Nov 2026 14:13:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X
 AXI PMU
Message-ID: <179511923403.118198.12888677660376650016.robh@kernel.org>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
 <20261027175124.3518239-2-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027175124.3518239-2-florian.fainelli@broadcom.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 27 Oct 2026 10:51:22 -0700, Florian Fainelli wrote:
> Describe one APB register window per AXI Trace Module. The counters are
> have no overflow IRQ.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


