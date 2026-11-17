Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=essczb0b;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=blC2FyDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=; b=essczb0buKrrDP
	vBndHyjJvA2hm/8JAVHqRyqnjTg3V6oSyL3RO7ExwvLb0WWKZTqLO14D6LA+ET41o8CKj5eueL9nz
	at+u3z2XM5CR22Yde4oW8h/OpxMDNDDi1vrepavOlYd/Ek2RVaYJItrydDaSeo+kGy5STl4VGxYRZ
	l4Bb0hShh6crS02ncNtOQcOtXqIBjm1+2IzDYd9F91KfM2vimV5FpmZzrnfT+8zWJuIbHn40kxFHy
	MUmdvIUjDMcus0r2zZd4CaDyfFtTiCBPQQUObo7SoSZLAannL+vQTTd4aNGcAJjji5B4AGmgI9rR9
	Wiye7df3NGIM6aaJtbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR1T-00000007A7G-0rWu;
	Tue, 17 Nov 2026 21:47:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR1Q-00000007A5v-2a1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:47:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so198057f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794952043; x=1795556843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=;
        b=blC2FyDRWXiVWFj0OarM9cnSDIBo7iZHz3gcWPGHkP6haJ+IzJQsP7JYLaqx/++qT9
         Bs4TE42OOpkOR9kamLkOJZ+G+t/b3xmIXMGdaGm778T52cdeG+j5vhWx7FkRHxjSuI16
         5IXMaZ1OWfBuNM0P/jcG6F2FG43AhE0/ErtcIIlzkZ8wvJMbxi4XutKhwy0YF5Niv6Nr
         JDlR7Bts9a1wIC8UZj/957VCmfZkqfzEk2ZBuxLV+hz4bChlBmQs/eFsvQSFex/YBzZU
         YJ/sO8e3jM4JDTzQp20+MclIvu6drsoEsuy2kwiKuotr8YM2H1fxgspqw1ASwCgT79bw
         uT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952043; x=1795556843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=;
        b=f3wznSKZdK87Hnomg+vRykJeOvgOsvFuxzXr3w/5r0YUQJIlLV1/PLilwMoipXfIu2
         xjZaIfXgRaraZ1HaYmnZidZrCwmQvv/bKZ9trPE45EvlPDYwk/o80Z92Wl6eBoFMQCM6
         g6kQEbu45UavCN6KbXwxin1lDZgjRSbrl+qph1fIq+Hp2WTfH9gzPbeVcdmCwrRLWnEP
         x6ktqRuYZrvVCV4iPzN89JHYSeUYmAV4e3F119SGRg4iWbfhToNOBBR56vu90fnQ/ppH
         kziLf8b9CYYLD9PS5NbBZELqE4gfL80ylfUPYfclFWYfHVAZxeAgSdA7727A9Wwj5LVw
         6ZlA==
X-Forwarded-Encrypted: i=1; AL+hErG78/4CG4vmFBpimrz52q9Qn33YDN+T3655e/Iy7Uenn2RaotTCiiLdBIr1eMqKHvurwjZno5ald+6l7XBDP8h8@lists.infradead.org
X-Gm-Message-State: APuU4Z/FWA1Unbg/Bb8zf5cSNXkRYlYVL6tZwlv6nij6+4/ulQgM/SK4
	biAHv4HSbmRya9HrogZtS4rxKAvGysAHahawVd/0dKVKuefnt4ILLe5vK8SyrR28ohM=
X-Gm-Gg: AYBFou3JXVEEnucKTVyUXnvyb9qiUmFToOzFT1Ay3yDXHS4zKKNQ3kYd6lQS30c5nYR
	ZlYCsVOUr05d7kltaTy54Sl0023pRkx/0GJOKs+RwBjA4wDiFjbL/MDmCwOUOMpHSSWV4/LqUdR
	CzUagztWXN05vtf0Lbdma0zYQ1Wl08xYWEcMOmI42Jd/KsfFGevI/BuzjQ+eGrkGr/xRs8RFU3K
	HjRRgajdABK+Le5vWn3kobTk518VvyBWsYdxsirIfjeFgPOGDt7YwPuSBLKTJ/+ZTde/6dUkS4G
	J2iUMhf0jOUtS7Wi6nVf+3VxlqSB0wJ412AoC53iItvS7OIFsS6123WleQI5iosvTm5IQFy6d0D
	+0vf+QJWg6mcyR8FjRIBduaduVsQQ8iVr8GEFF45+VU1+CyIF5Zdq6tDKsYrG+Rve9r/yxEJnoM
	WoP6ANLKbX8SsbGWxYD6Bo2QDdMgQtS8oRGpeJWnMXyY0PZU2DMLJdllQB/ADcTis5MT1z7csi3
	tc6WArVu+IwUPCz3Jw2g8qs6fRSouDRDD660dAmFPYnAHMj7tuG5tFKIZyR7F+ppqzaknOTe8u4
	3+E2BUtIdhDi6QRnSdbU039XCKUxN80oXODGEI8HQeQBufVtDkmOEPK5UrW61kUA5OvmmyGxQ/K
	/bw==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr10057405e9.1.1794952042780;
        Tue, 17 Nov 2026 13:47:22 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm14409575e9.1.2026.11.17.13.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:47:22 -0800 (PST)
Message-ID: <f68008ab-e743-4859-9b33-a88fc1e4b855@baylibre.com>
Date: Tue, 17 Nov 2026 21:47:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] accel/rocket: Fix the panic in
 rocket_iommu_domain_put when the domain is NULL
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-3-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134724_663698_BC5505D4 
X-CRM114-Status: GOOD (  10.33  )
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

On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> In rocket_ioctl_submit_job(), since the domain is assigned last, an
> error before that triggers rocket_job_put() -> rocket_job_cleanup()
> -> rocket_iommu_domain_put() with the domain still NULL,
> causing a panic in that function.
> 
> Therefore, the input parameters should be validated.
> 
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
This issue was already fixed in commit 
70e6a33d68a9b03335c5426332666e52d07f45d6.
This patch is not needed.


