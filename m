Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVFetpV2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhrFcT9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=; b=zVFetpV25WrCrxlH308kbdQfNy
	DSHnzQLPlK/0jzNM/wIYeezf1GeQbKeYAzg0CnCh0Q0mkYGWASnvSXyQ75rF/nEYwj2NKsUGVwpnV
	i732Ep2HQV0Z7nxPecHb2xWKlhwiKbJUb3irSo39O2wJIriPgVHQjOofDf2CqjGxN9t+OSvuxyuI4
	ZNXOTUwYLK+c8A3AALzL+4wVQL6Kthe8P7usnyq/d/a3vMy230pt0U0qBo5ncinDy/1ioAHAxDymb
	2FnEJlLsRaDGxmhYNbNpMjjSRWl+AvQnMN0V1xA5+MCLAzT257vGHQ60sU65jQPA3jrqeLL6WNuBj
	GN1RVpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpNf-0000000F1x0-20Dz;
	Fri, 27 Nov 2026 06:24:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpNd-0000000F1vw-0Mk0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:24:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b75c0f5fe8so1305589a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 22:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795760659; cv=none;
        d=google.com; s=arc-20260327;
        b=cTJDEye5LVyg1pEHofMX6EsWxqmBR35bvn0+wCDAaFzNKAJbrbfA1IysYfnwt90rqg
         EwX6pty9SquIqGXTX2vs/bTiCOGrc1Vq3/DFdT1u+wRHEkml8lz2ek5aUMDNbYCKJN8X
         q87BI/0RT8YfJ6FEQgi/bTyRKturAlOxIFti9gXAv7GghSVaVKSvf1n3g4SZhWdulhjs
         yjz1nfrCdr33YTT+gRyjGbkbnd8FYyVQrvzEk27U2EzjCW7tkDPG3XupnMpLmM+92xvt
         wmj7Ueye1yJ6M27HNJYYXftdl3r/MvIrHcso7fppcfFVmvEp/M2ib4s7BvhGqScGYxy5
         7MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        fh=NRIM1hLjSifrdnK8ppO26iV/SafpWXeCkAYN7st0SZE=;
        b=k9BRaQ1NK4T2D5c6DUj+yS7CrTrHmr9Qg9UvkYNCOIQdMVYDq/evBHCML0XUyNBleX
         67ktXi5pXcBVEoMKN16WbB3S3GShsCAkisfQEqQqz13FjLJd7GdDsjhX2OttEBVLKUpP
         46H4W0rlnbZNRhoU4UrPxm6vNF2p7vBTb1QM0SpwC9yGweqTOih/FW2zJr9XzC56VFb0
         F1svo22nbhs1EzDrd2OGOZD59Tk4B5inY8hFlt7wA8qmtA0FTtdowlfhVxcC7DKpr8Hd
         ReI29xhq29RMFgI5zNHPaM//VGdobggYY3d8wrA41PeKrv+ZHKQQPtNgjHmTM3exLB1b
         eumA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760659; x=1796365459; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=rhrFcT9/2QldNSbThaYhFQ9jfhSwk/BoMzT1ERcWsEn26/26pkIkfO4+mRARlaTyg/
         BUAPkkRs0/9H41a7K/w2AsbLwNQv9Cogyg/rbxkrsSvbYL7y++dOMl+e5ID29iU87BzM
         gf5STsAaZqqoKQNolAPV4ILrLQSo6bgqOLneyIcWHlfL58z8pEISH9LkrBy2noxGj5BL
         KH/2HMAfB28utpJAwjhaQJ+hwTaU2WW/rRFRxO3uH5D7NcoFlcAyNcAHnUPAmOQEgt6q
         TRoCuHpN+5KqSgmNWkygpVpwSPlMDa0NtniAFf/SDzy7mVddKb6vAwOKViOafyb/oB0U
         T61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760659; x=1796365459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=kwbeOVjrGO2LhMt/oBHQx2qW2xmJZB/q7Ztx8Il9wmoReNuox8d6oJU25ltuLoNQYv
         iXzQMk9vL83kuq6DHY9r61sduYjEDL13LWPvG9Q1GAjfaLF8SL2WzZE0wrtd0gJKGIKv
         yR6vAQ+g3ln3czYWO2D0wLi9Dh6R+R27y6Z9MGxGvLMk0BU1gd8lZFXJAJpkEsr7MbiK
         eluZonk/0kWb1rxXd27tTZW/clgztk2qPahqi3Ke7W7FatnE4xdO+Z6F0mvcKmOZjM+z
         5QQ6Wdty9uB8Vn6FPbeFga7sCo0lMbG8KSfQDXfRcdd4c8RvGf0ICMuT1ZXKpIj5I2Ij
         SNBw==
X-Forwarded-Encrypted: i=1; AL+hErFLrIDAgVt9ABUicH0wZGIdmKUDXmGn+/vJy6pIlM2hgtV/xCQLgohPjA8PC6XbuaoZ/IEcWHmN+wuATsuM5fp+@lists.infradead.org
X-Gm-Message-State: APuU4Z9jwYAMoaS+9mdO6kmuqKOh7RXtqPLX5Oq1cQmF2cWptbOshpqg
	dizP7OvtfspK6ls6wvbbQZIGwqHlzFS/TVe1ppYQakTHZD/lH/wHcS9RZT4FkndfzJK7za5Eg0T
	RbX4F07tpR63MxFCXETGHQ3BC1Idhaak=
X-Gm-Gg: AZFdTZfXcHwcqAMh3E/fZUlDk+PbbOcjXuTUhLM+dKK7/QbNtkE/O0yOdpyDzwc2ipn
	IzBRkYBXcnGrQLteV/TDLFrkKpwJf9UEyPR57aPSLQzEw33jxEi1On+7IhOmlxvVZ97WrkLIjYy
	6PAuyMPjh8a4X6uwEGMpK1NcV0ucYjmnmBTwv3B2rBCMmTFJZDsdy15i3qzxSa+Q4AbP+IjEQ0x
	YbpCuHRYCAIVExpuYt4sO23MavpSYN5wWlmfD8UyboOUGkAiNOy1pK3XYsdwy/w/g2PnJKQ1xUy
	qgc4wOLmdldk/iNV184bWIAH0z21Pf6W5J9mCaXC9Cs1KIjOEUW9AE4oFEm6XeclC0aZBzMGRws
	PRw6Z8aOmC2qhfbXNnmZaG3qw05a0M97jxC76bufuddJ/HekshGzH9tyKHwceiVQxSIk8grI=
X-Received: by 2002:a05:6402:c521:20b0:6bb:3e3f:2cdc with SMTP id
 4fb4d7f45d1cf-6bb3e3f2fecmr4072358a12.2.1795760658224; Thu, 26 Nov 2026
 22:24:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 14:24:06 +0800
X-Gm-Features: Aa3M54ovbh04_f0CIR-_hXe0njTveJM5wqr9aBZi2LAaLZkChYM5oN2Bhm_6rKk
Message-ID: <CAPwA33K7f2EbtH8rqihnxB8RkB1PzJTmDyGJ39ojROuTYwK0Dw@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY receiver
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_222421_189846_6CD7BDF8 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Hi all,

Michael, I kept your Reviewed-by from v6 on 6/9, 8/9 and 9/9, as the
v7 changes there follow your suggestions. Are you fine with keeping it?

For v8 I only plan to drop the Tested-by tags from 1/9 and 2/9.
Please let me know if anything else should change before I send it.

Thanks,
Jason

