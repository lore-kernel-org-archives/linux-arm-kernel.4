Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C27606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k8rO7rJr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sadxkN8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=; b=k8rO7rJrBYePib
	YxxAchixnZHjdCdsIP0mUkXdEhZCeWQjqI3dE4o6yKO/0R14M3hx0SiZsKQbKmqcky4KoIC95KsRE
	QKLfKAzrvSeQnClOPdtDt/sSWQMjnFdZR8RuV2T67Cc4klYNXvOG775bPb8xBKUL4qW/v8I2XKL+J
	1EyLX+FJE8ogtbPWjfL3fR4qF7Ew3ttI2rlyxm2oGN/S9weV4DSgnBj0UTqegCFBKx7HluY7P9ICX
	6DIQMJO7ZEOpG5tzTbblUGTfBwvMfqLVzjBdI/5vz+M+b+af58ETayNJ4n3jpqqzS49umBNye11dL
	Uv+R0yzecNggagX1irIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMCu-0000000EfhE-0EVV;
	Fri, 20 Nov 2026 10:51:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMBM-0000000Eeuw-2Anu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:49:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso583031b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171767; x=1795776567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=sadxkN8YY7a0bGSH+EaYgjTq2YO2EIlaPwslcu8AJAJJmUxltw3CFHD5qM4Q9k+wN3
         nuqT6ZXOjx6qyLG9svEn9YOx+3cdfpygRcE9+Gv9HPiZxGTKRhKhiuXeipZJQnddM9em
         NTHo6ZplvFNDz+HMQfJMB7jEok0ses6LVtk56K2ViRM40KBo5jcmhdVwSP3U1a4+g/5I
         PqoSUMbDUhicy3EBqcTCzNL2DrrPTrHxWWyYBAd/tEnF8RZK2Nq5ztNvsoz+mbzLRMnk
         +IyGjpNzoFScWO+RPeSapduCa+cRMr/o38Ww2KmVl0BkWH4iagFC2W0Rf3Eclj9+DdW9
         HGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171767; x=1795776567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=Xe/OY/SNV10pu4eQPiDzwFq6HIZQTpgwlFOZB43xn4G0uSDynXuZZvSZcIoF2av8Pq
         u/asDzRgIb8qXYzuWjiOVunpqDg6SkbrQJcovNo7IpET0C+erY9BHUHap2MWxYKvwXIr
         S7JVEeslfaTOf/21JYWk1SnZ9UYdHKmbFBZdYjMh9yIN6HhsbUWLDvqy1M5pJxgWwLYV
         zNFRLthyiNk6PCP1G7oHYspM+Z9qW1avZ3Sd0tvQH6FJjtru5thirYhvOWSC6hHkKvId
         a2acToWaB6jg+WbbZUUMl6/hGSdh5YDNn1RzpnYWDscxF6PKBGGrhugeP4CIAWAxMIm0
         n5NQ==
X-Forwarded-Encrypted: i=1; AL+hErHtevf+JODz9znnXgzLz1J8HQr6v+g3PLCQZHq5csTruz6uOa4hDv0aQLhP1IlZ7Mp7axccEVpPv/r49CJFeh3X@lists.infradead.org
X-Gm-Message-State: APuU4Z991fxw2a8VonWHHT+3UbK224/b7h426GOFWUw8WNqYvw6uw8Bn
	lUFUtbqFLXwWx/+szFOkCuhA4lqEr61KBjSYj5J/aqrzPL63QHIkOKLg
X-Gm-Gg: AZFdTZdQ3c0R2YWS8487rxZDvYxWh+D6lbungShqDaSH84N6BLjZh9+JQFCgBpnUOIn
	ZR5go99pylzTJDm3bxWI+ikX+fCqQKBPduZxwGUzCRb2P5k5sbF0t7BVoeFLwTHFMR4ycCkQJ/g
	EFLbfP4z/Bb+N4r/3xxX1FNYqy5H4ggQtOdHYNDnwBsSB45r9ztQrvF2Dsyq32cOO7472umEuR0
	guYzfPTP+3iwYHcDfJr3WjeuTZamiAyTSEY/ijmrlwlRs/NVAihmjXc0pHYBvQzkK18aSrYxfbV
	16leP6wNZ9Lixm9ZtMqrnWouP/20kj+e0SIJi0zSOnznMcCQydlNldUKwo/VLvPP1k8DT1JrDlB
	V9pSkgjDXbqxJM73X6mK4xyMnacNkpSISQ9nGQ9BB/kc64qWfe3NAVMvfPYNxia8lJymyLveOdu
	DrzLk1coMFrLGM+N7Qxz/4HzaeplAv1qcjgeIAM0zvT03RuojYlygQ8ZeA/VS9EkU0/rmDtYUuC
	IVCRkmnc4W++Szz6cq0qmQxJA9oBb8ULZrNOjyiqEMaDQcCcVUy1fTSvLnbjoW7Pp3HIru2BtCd
	61faOdb3c9OyXd54V5kcGzOnL+V+6KSgstxfmxe7k/okvKiu
X-Received: by 2002:a05:6a00:1ac9:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8c87d11f274mr2712547b3a.55.1795171767464;
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm1292915b3a.24.2026.11.20.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Message-ID: <7f51f7fa-7e81-404a-9b0b-44efbc38cdd6@gmail.com>
Date: Fri, 20 Nov 2026 18:49:21 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024932_671552_0F942671 
X-CRM114-Status: UNSURE (   8.60  )
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
> for 2 channels to match the DMIC hardware layout on the board.
> 
> Fixes: 815fe2e0e65b ("arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

