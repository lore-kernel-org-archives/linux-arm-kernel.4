Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE621606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gYFIH9bj;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=Q7anUxom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=; b=gYFIH9bjjIlbAv
	D+4WtqoNpsng5jEZe2ShtYE8hnq1jFEMrUEgrl9Ahu5K9EGeAeSMChn10nUfNKvf6qmU5nY6WKnrH
	G+k7Q5jH7BSxC0CINr0XKSlaNXuTkXGtvDjDVKxzsl4A5d+MysgFMiH2n+Qnfz7TcOOoyhOCmAqtF
	Rxvh1QiMzUkxjBXGAsLDoXmPJV9OlAlaof4DSNiTfn6mWaTdfRekTKJ9jht3fWjZxMniP5Z4Ggi89
	NekDDWH4fvuus2tQSuhV/rCBKucOsLW9ph6vRK2BWBL3PpihU9LgWv8eY6wM7CuOvHtctL8IMOmTX
	dEBgCXutrjzXomAMvl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjPs-0000000H6HX-30sq;
	Sat, 21 Nov 2026 11:38:00 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjPo-0000000H6Fg-3WNK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:37:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso2281186a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261074; x=1795865874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=Q7anUxomp2wdVcLWRSgo2MpWhn+rAO24OR7mTkgPTeUMtoSGuUKiT9D7ndKbAhkCRd
         G2L1siAqg3wQapPKTRXOGHrGq5Gm13fAutZI4cDycxWTnEhRwMv1pWsLYVlMY2HhGsum
         Z/RAiDk3xCCz7zFYG4zTN0KR6CAai33oruGV5PgS4LW9272jn0jywH02mAFW2cLo0Kpb
         +ms3WHx5jU6jGLNC8GtNk86+CcPd1dGVxxcFnD7yZzXnsKNOhhrnp/Z8uw+d/aApIPAZ
         xn3ZUjHQa76OabFyWWRyp0JepSeQTXCpP+TJstcty8CN0EX/udXZKpyTWUgq4HNDv6Be
         QgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261074; x=1795865874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=Yuv80ld0MyMKP/mU93LfxKom0BjdlleIoWuo7EyFfmIFk2IaJzXLn5DTpwEPPcTyKo
         ZIk+3rY4QDDapjAqmvWoW7OnOrRj05jsGL1TfhRWexKOpIHKWS6NdKFTM6xSWmumrp7x
         UH0Osu+34QushwNYVkQF7PqEzDYZoseUTS+ICl60i8yMyW2c+y9UzAYS+2yiBjng5Psn
         42RiGh7K5/bjJdwl+OVdOi7iEbJPHSvx9CuCV1YT4Wu6PvPXNfP0WwcBWL0FaN3Ztya9
         Akmgzk4RSYyGVDhi/BouuVwh+8y6pCxsSmsjk1eoBsrIT2brWd9rQmjqTN+/IE1FxlLn
         0YxQ==
X-Forwarded-Encrypted: i=1; AL+hErFjoCIDWFWdiiCvCX9uTxKNwVGbXNusbuyvVU+S0q2imR++vXfs2pHMbQXYrBFYCJVTtx9R/n4UIZhr2sbccN1Q@lists.infradead.org
X-Gm-Message-State: APuU4Z9HPqkfhjaPgQrj2UBfHoZ9NcaBjXDAFk4s1Xz+4DyEgszuwG3k
	8fWx293L3S40OseBpxToi2WDgeMHgHe5vVTx1o+msn50BjfXCbrMfyDMYSKpGSJXKQ==
X-Gm-Gg: AZFdTZcXzmIjjS3lj6ZpGGFR4tsSN1SJMVL8cgj9M3XtaKgEeaQGEHQ2PyCRAEEp5HP
	4Em/tqFlklUM8o3GjVzjEELWVpM0qAkF/L3+zRrVIgvYyBWzp/pM8TFI40xFL/p97NKU3FPTsz8
	DeXlprvu5uHehnlbvDDKAT1Zm+sJTmJmSPU0+PmqpSjzwCj+m3KZVWJvN3B7l1h9pQpF54p4qpM
	V6SpJQBFl6t35brnhfo6EPfP459GF9K6IMGfJmxFCUseNIVnf1yJ6KF/UT6/EhayTuTYR3CFta9
	TzLGHoPwsP2K9MWv91CNPzetV0ok2L45AdTImXRzS6GY8Jg7U0mjiSg7mR8HvS4mvlSsTEWH7UH
	tjjmSqEERQvRHMnvscmGDn4oXcIx4hym5/23Nm2CoX57516jQZ8g/LCAexxExv5NKTrYaEzYLm5
	YepIfIQzxhROh+NkN568VNqQVCFJIZv8Esz9xZ4sFVtWJFL5ELQzs6V1fJLmC5LF1ADCYf6Dudg
	RQwoEFFIeRfNp3vbJh20vaaxQdaZPW3kur4DFqdEugp9U4WCYxrLM0ntDT885UcY3kQNNuZDOsB
	Ew40wEetZxI6lN8uihFiAQihoGiVcf6CQhjbr7egxiGHcjsA9ozGs9R03zCP4n9gzbxaZIaQdKe
	coEED3+S7vyEPwPh7Wj2KytlrhQY7kiTbYj58AdnzPCGITHlFs33i3rF9baoG6h3QbZF/y+meAk
	Dn
X-Received: by 2002:a05:6402:1cc3:b0:6b8:7816:8735 with SMTP id 4fb4d7f45d1cf-6ba37cc09f1mr4099511a12.3.1795261074138;
        Sat, 21 Nov 2026 03:37:54 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e91c3sm2202346a12.19.2026.11.21.03.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:37:52 -0800 (PST)
Message-ID: <1cf0e772-e5ab-485f-bd6a-d1088e01ad1e@pardini.net>
Date: Sat, 21 Nov 2026 12:37:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/6] usb: dwc3: introduce Rockchip glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, kernel@collabora.com
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_033756_894184_3416ECA3 
X-CRM114-Status: UNSURE (   6.47  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/11/2026 02:01, Sebastian Reichel wrote:
> The recent Rockchip platforms have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order.
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302, source-only Type-C) on v7.4-rc3, with usbdp part3 v18:

RTL8156 2.5G USB NIC, flipped (reverse, normal, reverse): 5 Gbps every 
time. Before the series, reverse needed a dwc3 rebind.

Apple USB-C Digital AV Multiport adapter (A2119): a SanDisk Extreme Pro 
USB 3 stick on it reads ~220 MB/s at 5 Gbps while DP alt mode runs, in 
both orientations.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo


