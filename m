Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7787606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c+dWs+nk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8IFRRfs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=; b=c+dWs+nkia/0ol
	FycuINUn/HiA9xg/rfnHvzJw7sDaVgG6tWlreWTexqWJmesKCGqE0UNdoUu7HHwYVbMXWVmAgRqzZ
	9lH8cnMGXJH+m/BNIe1Uiwq5HLPWrcXqcmWuCGjvn65g1Dl6Eav5f9Vclqegm6bvVcxkioQAnO9fe
	H2oet9Q4LDRsITBSN8TKoZmik1+XWoOm7/GCWDWdOnyCx8UDy/o2w1/sbm5kFiubdlJ9BIJN1T+aV
	PcMyhihxy3W5k5qYJOs4pckTNC1frAkj6vJ8raBmYJ55IjcrKvWzvbiMrbFBcgr8GVTduDvMDOQFx
	WpVBaUHOIxIqvdHbLjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTpF-00000007P6m-35Ad;
	Wed, 18 Nov 2026 00:47:01 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTpC-00000007P6R-2zAs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 00:47:00 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b3ada81853so504272c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 16:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962818; x=1795567618; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=m8IFRRfslYL+r837dgotKz7zgp68SVel5q4AujdzDDnNtzfnAU2ICC9RZQEz3xQ3xT
         DN4yHROqiEx5zmA4YMgLJ4+7IP94+WLDYwd+QBV452JggFlUUFbV8FA8d0zSG/Of6hUd
         1qz6vv8a7HNYtqicwmWSVGvcCHGQ4QoYdmuwHVEi6M7Q7ah1a/G/m6fu1ueekw6b2Myj
         MO2ozztSx6ZtKVFOL/NQRcUy/YsR1T02HCWYJYGYK64uJonJ1MQpyieP7wQOU4CwFtG/
         n8VPw3OpdXeJ1QzZLKJ4gKo4GLBiZowcqzs82TAkElejGm3VtKpeo+P0h+w239URLv/k
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962818; x=1795567618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=qFQ/+0+SnqQnyNyencQKG4eM3MM+LZSEeiWdnkdeYZhNkNxk++7eoTac7gqMl3BO+J
         zheWZ8SWx1Q4sMQkxRTRk/IbaJDd55nTDI5xWyibqlxf9BVegS4mjt2eXdrbAp2UIcGE
         qleyww8CLJZhiz0t08QBB07AlJnCAH9xt8MahgsiXXGCoJH7KVhF82KKnvkLFObPIZaV
         bsUN/8SRhffOIAAUCK6RqbgEDiZAj9Gdn7wDt1fs4VcS/qED/dYTL0GAgphJjziA78Ix
         0V1+G50jM2lBf2wrSilI2xCRXSvJIX61weWyaeAVqQ4JYoHUcVoE1kaZsCjcs0LsyZbz
         bfKw==
X-Forwarded-Encrypted: i=1; AL+hErGCqGIezNHq2U8r+8dTNTYqHASHUCO6FyLgXTmdLIBTELPiqYgVf2drWFAp83wctpwg+UAfq8ti+w9jGB1RLIRF@lists.infradead.org
X-Gm-Message-State: APuU4Z9KM57Gyh4EwNlLrR0jKprSsua26UUrh/2d5YdkRbx0suRXosJL
	WXFg2m/kPhYtNI/v4CtfvGRU3BbpxfRou/DeBltH9TVyAB1HH3UIifgM
X-Gm-Gg: AYBFou3RCc4XBD0KX5YyI1nR9H7dRqvHjlurLuvB3jJcJoyKyc+VkDG0ER7zAGrx9BU
	WIFgd/c3/vDSn6aCupZ+qbUo/KWLmW1ur95l1nFGmFVlh6rfTn14+cQudlUmCoUv3bY+2rzu/h6
	xeyZL0MLzSCEa1hIoP7KIeaG3AVg43IaW+Lxtwt2qls4qxMt853WwECRtCB6zHiuHdN7qo0sB7J
	4u1F1fLH+Vy3AIhKqJkkRPJt2IkCBSw3bbaiBdhBH1Axt/hzG54K0K5ap41GWU2eD1QJzJun6hs
	ZMQ+tJo1K4uZJJgKSCN4tzvRv9qruLy/4BfZ7GaOSKBVB29B0VbdJJw8/xvnjC4p2yB9XixZQZL
	yoe3r7WLafwbqngD8I6rZVODScQ0cnsJQqqDslDhTyOYWUPKNmRwKicY8t/faCCtDpqysxgADlc
	H3rONN+XvRSJttYB4EIaY4ipc5XSsYlwpDGxToXcuz5sRv/w33z2X0zPPprLCVGmPCtStHvF5yY
	AtEJaYa5gJRXjY8R2038yjwobaIAa2CecmsRpzYhGnolsBhtGH3TdjzmBLpDOKMV5adgitXzfAm
	qVmfmtj/Qe4lWggvvW2qVATvv51MMD47xDWUDpunqUv9peZoDQNwvEexwSKlAoG82G1J3PVlDy9
	B
X-Received: by 2002:a05:701a:cc93:10b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b543cd7146mr1086049c88.18.1794962817804;
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2505940c88.11.2026.11.17.16.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Message-ID: <aa081f74-a15d-4ef6-86f6-cd81455a57c0@gmail.com>
Date: Wed, 18 Nov 2026 08:46:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com> <avxhlPnmjDhZlUmt@monoceros>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <avxhlPnmjDhZlUmt@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_164658_757654_7D560E9F 
X-CRM114-Status: UNSURE (   6.89  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Uwe Kleine-König 於 2026/11/17 下午 10:16 寫道:
> On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
>> +#include <linux/auxiliary_bus.h>
>> [...]
>> +#include <linux/mod_devicetable.h>
> 
> <linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
> drop <linux/mod_devicetable.h>.
> 
> Best regards
> Uwe

Thanks, I'll drop it.


Regards,
Zi-Yu Chen

