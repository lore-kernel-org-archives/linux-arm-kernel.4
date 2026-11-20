Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+bI39kV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogLaLKEw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=; b=L+bI39kVndTdTP
	GVhQmEjqpK0kUXZyiHNoHJwmGWUCDxOlngKuMUczpG0vKraU2C3lyR4YdIxDykrkq590yG/OyD1wV
	dahIGOtW4SBCZSYkEN0EWAZRwsLMd9dwodn1g95uHWpJCYvcjHpPJa6Pf/ZACET99ClbgTRMYhvKU
	me0hEbvUhXklvUHbv2r9ohaFa2zsWtEWeu4DONJf9r50tWxuxNO49MHKEeVe66Gs8fqDNlu1GLxbA
	u4kuNGSPVWFflGQrEhv+rh5tKF/U0rVjDDkOfxiOap5SplQBDEFr+lk3cGZmcSWHaI6N7Gifao7m+
	O6LWdEDPu0gXiZFwgpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM6z-0000000EdMO-3BVC;
	Fri, 20 Nov 2026 10:44:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM6w-0000000EdLW-3SLW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:44:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f052ae3c86so125305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171494; x=1795776294; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=ogLaLKEw4Ig73fKL6fP7eoIvmr7m0GjqgsBosC/B2Dp+24yeBGxDAX2mGMkJJHOM3s
         9l89TuJjE7Gucs8YXvbDfAhthjfebcCaSjTwggBRoAs4edQa4uPXvG46lbr+X8/vjnX0
         CegNKngmEp/QV5H/AvpNfK4rERnks9FIMSE/7lHS7wXXbA1rql3hLOLdPGe4bSznbf4O
         KnLDjvWCm194XiSG2vccd38De0dVGpCDMKcTI8jWypHvnDxQoUGJRAMAK0gb7t4e1s5w
         BYWAtEpIVxvC8VDEzqMMCfh5MjPUZaftpiVNAp+w9LhDHrKy5STDxwvm/zwpg4srNtmD
         4CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171494; x=1795776294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=uDfCNjS+XeKBR1ji9VNmpwq8SS24sAift/gpicR31Gn0v28cdlMNMODhLs0Svfq8gl
         q0wLte1Cy9cNF829DbXU3Tu9RcvVOnaa4S7uK5jce8jtAqeCzGbtJHF43ju/qFkEr2H+
         BkMljTtE0mFDGxoyY6+dPySeHtLkEQevJnaCgDDD//NLAIIEb9JS0guednvSVk0gG3+1
         NVGzO9VBXBBF057T2MYtO/YT3S2GUxQa0p/gddlqHr0krU7nw71ErIFJHQhyTd4LrAnd
         7lYVHuuQZVGhxjsGdiNeAhjjSaDILTlE6vbArv4h7t71+S8dtit9SMWecIvOLcB1ms3H
         R5Ew==
X-Forwarded-Encrypted: i=1; AL+hErGV7aC67V6GmbMv5D3/N63uzwWShWnY+BL6azO//jW08EKevAtmHhj5vD5fb9NJriwk8DDU/5IGZqTVGpFL+SLJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/5Hoclq8QYm0bEyihFJ3/txWR7hJMd0mKbr0Vnz/5KG4vlpuga
	yLIelU9y5dPqAGcsID5GRpfE/wlcSbC1Uqn1OdraySuJuyAQKv/Seq6J
X-Gm-Gg: AZFdTZfgd+1h7XA8wQHXH8Jh0t62LUKnFjTcH/UUglgGGz6XUrLCMdT/8yory4lwQ6k
	eyPusn7YzuNbNCAiMZNeSgnkT8reunmDpEiKkJ5GBdV1C0QIK0j7yzyTH0LThHtUXaFBDzQbs91
	7EXzNUHK8Mua7XwfHFuHHD2d9EI6rhtuHUxLFFRhprBpJmtQfEC7HoyM7Q/rTSU7BUZHzskFq/K
	BVbuFd2eucLuEs/kl1i03056ARbxvDgR0HKVZBwAg9nVceJTohdQThNvfs4Hxyi5uCrbTPxZXBf
	m3+w4N3k3qqhVUZVD5c6SnTCE+H6qScHoCONwdhDlk6MvHe85V7pn6LOCBcRJVESJJTEP7WrQ/C
	WOmPfVdKf3y/phEDfkg+i+TnfXvtxWp8AoLUMFhTuqHHnpn2gcrs4jJZQf2wcTCLlUyJ0SKpOi+
	vOucCIgBnPF4H62s6CSrWQhYB2G61y01hgbqW0VpqOokwj0H032AcKM/nSpHyOnBm1D7AZJgB/J
	21R/+byzhBjrwstS5rZKE3mrqELLreDtOmSwbjh/YVb6lmWK3yT/rlVYAHdwy1yDLVT8ftfFMy7
	/NggBf0bHVfuSZrksy/NVWf/981EsJFHp6EHkesV+ybCUKnl
X-Received: by 2002:a17:902:e847:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2f03f1d63c6mr29795165ad.48.1795171493751;
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1413f3sm12068815ad.68.2026.11.20.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Message-ID: <14142c89-9e0d-498c-b0e1-08ab6ca56e72@gmail.com>
Date: Fri, 20 Nov 2026 18:44:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: imx95-15x15-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024455_016904_D5FF1D36 
X-CRM114-Status: UNSURE (   8.26  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 2 channels to match the DMIC hardware layout on the i.MX95 15x15
> EVK board.
> 
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

