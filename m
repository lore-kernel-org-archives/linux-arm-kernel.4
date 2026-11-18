Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=prWjmRMw;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pUgfagwF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=; b=prWjmRMwLL6/BV
	HCDZbe+a3+TEbjBciXGVo6joAdKGvmC65kQoLrbzfiFpaKdy9WMFd7B80ywIPRWQKANQh0qYOZ0IS
	zbM/C1Nu53pHsn8/g9PLerRksftXl9XUzzlAkDHbLuLzBSjUoBvB6uMSSChZGlzI5mfnxzCrhzSqI
	m43nkLeVrbMbTfVDdlUC1FPbEI8xK3QYcnA6QIW9FzPi3CezczBdH7LzQoByPZ/QzqxT3fyZVqpXQ
	D5c4urRrDxVvzbldQyniUdimqmSzt1EL48AQnmSOnkErnSup2BRXnpdLn1bPt/BtusTSHpiYSM5W4
	BFb98Nm1k3kMiNrjMPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelb-00000008qJZ-3hvU;
	Wed, 18 Nov 2026 12:27:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelZ-00000008qIA-2sEZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:27:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-49465892f7bso653872f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004875; x=1795609675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=pUgfagwF07epxOthydXOg5trufdJfMZg4oCAIEAIwybp6uDQ3HDKibCtdgtMWEo1DG
         1vfbfPp1dt7ETdafZ7mThIb94mpTkKZyia6aggca/NV90Is4oaiPKgcv63KebNEdFioU
         ItT9MjX0ljJ2oD3O/zRD55snr86mI1m0V2KESDFWGmJ73IvmaJe7KUx5h+uh92cs3HYp
         IcaebjP513H6NUj7MUASFi43I4+3o2EEOWMvtcmLo+vQHYKTXNJw2dfPMmtxJkLG8YG+
         wFv9P8zGRB66ajob5NvIJpRsceMjRkTAvP84QCJlcpj7JTWXR1404Bn0HGEfPnX66WZk
         8HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004875; x=1795609675;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=FpR7CWKYLl+AN2d/uzTECtnshE7Lt7y+eA+7vXaAfFp2Cc0Bx1IAHqTnNQiIGnMY6k
         /wUsP0zLzrXSdqIU5YlmzCPpb0ewkS8D04iyg0i/m/3Ubs4z8fsLOtivLkEKvpRpiLFa
         oxDINCgrFSsqLgWKr9MoN5/20UOhbC9iuVoWr/Ev3PXamOlHXka23m2icpOs8kBbRsUJ
         7o5b8mXZc28oJZFTbxO1Ie8ycntJuJIDr3KpLphLaVrR1VnRbmgJ4+ceUFnRNjYl2EKM
         s7imp2aTZGC3s8wMygCed2vduZ/JEdykghc/4UF/Be7GnNR1+QaiQsMUzNWTZso7ju2J
         W8vA==
X-Forwarded-Encrypted: i=1; AL+hErERRlbLJhaSlCmtq42buqjz13WGc631pnqDQ9SBgCnr0FdGkrsLJJJTwkTJ+o8DNRENJ15DN+V/drPQl1rk2VdB@lists.infradead.org
X-Gm-Message-State: APuU4Z8nwG8YD+QpeTy8OMSllfS0ZEtc82/qL8TP4TyWQYeUJ6GviNUv
	PekstBH5/Karprhr9X5u1heZDWQPqjBFRbK2raX+R63rt5QYzeajM596/04ObqTEvYA=
X-Gm-Gg: AZFdTZfoJa3n5H49/PXF2nrlMOG60sckOEZzt03mgrn/3/kzhYYXMrcEgjhoooYW1ET
	41gG8DJAUFsAcEXquEop+WWnNCjZQzffxHn+4FMekoc5UEwPQPpFVwykhTqWiJHVMbyO3OjXSMo
	glj640NMgFXZWMk0jVAVtNlw3VR/LtYXjhzesdTJE0o/1y0vrjg3Ocrs1+p2uCCyNlk6fjKK3Rp
	vEAAuA01LsK5S54m+xu3xEzX+x4vr29xmlqsWQ41HLgBgxeoke62ZlYJvnAV0T5KPEpIh/JTJ1W
	Jm7QZ4dq23TdcshWnFysYwjedl7PcF7iMm1MSL/XrSCqf7ftjPA/t+gmctvQswfq4gDfv3twgAy
	ovjoi87v0K5L8jZGQwVAo92+vseMfRDWbTzQsca8vlsQpwKwn9FJD2trqwAYwcDM5vgFGb2zoEX
	6+92ZO9RbBS5XWtv/ZsyLfENJxJgiArOXPBgWiPvnnZAxc15L98l8CsMgbeucctL9eXoXxGiCeU
	8d1KGZylJMnCn+zDG9qhk+kb/WDSIrXem2LQvGpmA63uzFoq6l/pQwFHynNieeYHGPKY12EtzGO
	H66nuLhuoEj3N3+duAbQe9ihkhB1WpYXKYjG7GZO1Kz8KNKnSeqXdo51Uz3PkowhPnoe/pGP6id
	R0wZ/JwgOFVRpXSet3+juzXM=
X-Received: by 2002:a5d:5d0f:0:b0:4a7:9630:7b32 with SMTP id ffacd0b85a97d-4a7963080d9mr2359433f8f.46.1795004875475;
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4675322f8f.34.2026.11.18.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Message-ID: <0bcd84bb-6a87-453f-9b68-04dfa95f34a4@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 08/12] accel/rocket: select the per-core clock and
 reset counts from match data
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042757_755706_AF2381C1 
X-CRM114-Status: GOOD (  14.11  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The RK3576 and the RK3588 use the same NPU block, but with different
> numbers of clocks and resets.
> 
> Take the number of clocks and resets for each core from soc_data in the
> match data, so the driver uses the right count on each SoC.


Rather than these clock and reset count rules via soc_data here, can we
just rely on the DT validation that is almost equivalent?

Then we can use devm_clk_bulk_get_all() and
devm_reset_control_array_get_exclusive() and not worry about checking
counts and names within the driver.

dtbs_check will already catch cases where the wrong number of clocks or
resets is provided, or where the names don't match the ones expected in
the bindings.

>   static int rocket_probe(struct platform_device *pdev)
>   {
> +	const struct rocket_soc_data *soc = of_device_get_match_data(&pdev->dev);
>   	int ret;
>   
> +	if (!soc) {
> +		dev_err(&pdev->dev, "no match data for this device\n");
> +		return -ENODEV;
> +	}


Since this would only be caused by a programming error, no print is
necessary.


