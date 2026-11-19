Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0jWObVcP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZNb+TWs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=; b=0jWObVcP2YmRHbzcB/cyLehs9r
	mV/Akkhla7OjaNY3+kK8e+LK4WEhnM2tSM2UObsz2PxsMk5YYTnuMFAg8uC4dJEWxxubkUZPk1sRZ
	+2GohMF9ZCN/STG2OOSC4lyxJmWIKY4GjD910QfPBDVUM421QBNBHLd3b3hIluRTYkiM/BTUf+aff
	Bv35voEaLFZ2Hqz57sJU9T706n/HVOHlgI71I8yVteZ4u5e3AwwbRtYZ88s2+ueFOp6sRPDjtk3h/
	C51rtvezWx4gQmpKAoEf/Kf9gdcsa5bsEM3nHSOnf8LXTB95PuMYdxGGY2yKJkLSbLDz+T3jzebHS
	Di3SgCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx7N-0000000B8VZ-1zEt;
	Thu, 19 Nov 2026 08:03:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx7L-0000000B8Un-0ifl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:03:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso1243072a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795075417; cv=none;
        d=google.com; s=arc-20260327;
        b=nIvNnufAGfeuX8W30aod7zctVoJ1vAof7TkjUacnEYxgTH/+039tu5WkDg3hxwueZ+
         xpgKeNdyqN3zZ7y3bSy+0Eqqn3Q+xmHCB4z4IQOw1GpVsXtUiG44/xZqiovxMIOjcFU5
         uYTDZasRGco82V/Ib4MsLjCsmDuCbANLHFTUnuyZgh8VoajKYyc1cBqQbL0D8jVmnp0q
         cV1CdYzTMWGqgVLvKW7IQiepJoUYNJX+T0zzKZcRxRrv6bBOGsphVD0aPpMdyPyIPYuV
         l1NZJmtBabnt8tl+3HtaNaORqOBHaxix03SlwhQXHqFL0onwXzmDHwoL/MQn6sCJEOby
         Og5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        fh=DIVNKpSBXqyRMW9/ioBtnYHEN6ThHbI3wzoP4Lj45UI=;
        b=XxzGOPI/c984z34HaEKgk2ER5+yI1M6Bf0yW52k81tk3OHxAiXWcAcqsx85vKySl79
         TxRh5hYuANECcTCMITOY7jAKuDleq44ZhGKV8za2VGyEJkYBr5cF7h9PYvRiBxpsxjjc
         ZX4m0dcpJ+J9jOuV2Zk/780ycRDaw7eIhN5MlMswrpefKH5cjkwmScTNkXA9WkPxXJy/
         RLq03U0FzGMdD8s9vX/93TnuGxUPXRYrrDUV/4z15mfBDP1Y9cjD7q4wTKqz5ojaXs/U
         lZ5YUbBaXMaFFstvNM4X7GP+4gtcDfF5P0EaPWggCgDO7DUjX12XCWQdX4J0atZw5Xem
         Cp0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075417; x=1795680217; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        b=MZNb+TWsfOfTrQFmwzp0AMkODA5jfCOxHoXwCegBIm9TdDDCNSH6hhh1qBnKmZc5w2
         CYcosh3UnuyaF8NtDgwJG+4dVvQDWROHnb/RYpebAYtsX0xP7ZHZ+mxbLIKI0bU0De7Y
         ojUI5/N0v1TiaUQktyx6kiy+G6DqGdVYs5AJrbfyTdjlHCPsJoTbfXoIkCW1M8LEWT6l
         mH6t8WtxOHGUXq5ue5FEptqDzAN0MkJyCsN3v96XvbkSLTX7ea3043R1DmnYdwnZdFHH
         sNyNXOuOMqnxx9ksnl5kE+JKEhqrmre0BMj2/rGGXGX3Vg7DJX8w9bSBPwSL6evGi3qO
         mxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075417; x=1795680217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        b=RmUywCkn5psTMI6qAhQ2zSqZIP+KaKxnhHUFGDL0Gxn8vYMQW09IqTdUox1QM7i8/d
         FQL8Yi3rKh9PZDA/aJTdH6GJGQCNUF7yTRoMe6jZ50jTNJ4sqaVvANNdNptIEdnuS7DA
         XWvCpmPHqorqJj2Sbo9iIogRjRqOYqdeM8hQjj7d48nK6YXMqy/0fKe6mb56eZfvDQ95
         ukFvnGswiQQ45tPdf1dUxzrVY1xvVJmVtvxc49EkNSz/C0YvrWXiSiubFCKly6Potx64
         6+woWqxzLmCDKU82Qq4ccJCp1S34aZ4Xd5PF9GIwFLVNcRAX+v29JaD0Rb69cM4CevGk
         AUvQ==
X-Forwarded-Encrypted: i=1; AL+hErEK2tIz2bzVwR4UXsvCFhkvvidl+TPO+YZxsNmHgU+f43WVcu+OQKhYXqcr2nJnitAlIE/ClP3drir3/mFJjuqM@lists.infradead.org
X-Gm-Message-State: APuU4Z/1N+c9pscnxyhS8AkAo3958IOP7JEYaBQkmOisV+Rnx553q88i
	WXzAucxXgn1paINo7PscvUgV4azXfgDZAspfl1ERwYvZRKFSN2fXPKiedBZU8BwwQ2P8cKDn04d
	4vdOcZMJhpu1IwqAba5nb1zovSVav+P0=
X-Gm-Gg: AYBFou0BOWt350MTDaA8BAwiJ6Rxhulogr+6vZCtEZlusRD9cMQp60eJDfmkkp2j1hD
	WlK8IG7+erF7I68kkow71yUbt5RUBP9Qvem/cEQ9kiV5PD3F4nJUbBcqXCLI74d63+hk67eFeyr
	S38VLZGvQtTPbK3QiIO5iOR1L3xnN0RX4rsSgG/C3KR4b33A/IuRlo3NxgbblNVSigjVnc+tINC
	bGq3j4NVvGtaXPb+Zf+L4y8PIIFYwcxb16Liqe7wXnpDeiEh++slQcV1XePI0+d0BCzFOBb5iSp
	7M4DshDsgVueL3ldCI3vItF42tP4gDeOMV0P5cgWACR7UUAromnXKwPifnh6xOjtWuDH/VYI/fA
	RBlAr1JsSgbLooydqDP9Q0BJPDpOG3v6Yogc=
X-Received: by 2002:a05:6402:c51b:10b0:6ba:12d7:69b1 with SMTP id
 4fb4d7f45d1cf-6ba1f9ad159mr266992a12.12.1795075416554; Thu, 19 Nov 2026
 00:03:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
 <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com> <20261119-re-anand-rockchip-hib-rails@iav.lv>
In-Reply-To: <20261119-re-anand-rockchip-hib-rails@iav.lv>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Nov 2026 13:33:19 +0530
X-Gm-Features: AclHuK8PCuggsZEUPGrild3UXx1VS_EuxaX_wfHV2ilz6neGEig8c1iMSX4XEY4
Message-ID: <CANAwSgSs75e6ACaP-bw_JGJ1=VrMGmvduDCx6HMhXSmLsOJddg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip-host: Support hibernation with endpoints in D0
To: Igor Velkov <iav@iav.lv>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_000339_238174_1A1CE737 
X-CRM114-Status: GOOD (  16.48  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Igor,

On Thu, 19 Nov 2026 at 11:54, Igor Velkov <iav@iav.lv> wrote:
>
> On Thu, 19 Nov 2026, Anand Moon wrote:
> > It looks like we aren't disabling all the PCIe regulators (0.9V, 1.8V,
> > 3.3V, and 12V)
> > during suspend and re-enabling them during resume.
> > Shouldn't we power down all of them on suspend and bring them back up on resume?
>
> This patch keeps the rails as they are: suspend_noirq() already turns
> off only vpcie0v9, and the other rails stay on from probe to remove.
> The 3.3 V and 12 V rails power the endpoint; cutting them in suspend
> loses the state that the PCI core and the endpoint driver expect to
> keep in D3hot. Doing that would be a separate change.
>
Makes sense. Thanks
I will check the disable and enable regulators to help with this issue
and will update you.
> --
> Igor Velkov <iav@iav.lv>

Thanks
-Anand

