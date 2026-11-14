Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A4606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pCSVdB26;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mh7yOd9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=; b=pCSVdB26HxYAyA
	gNEi17aE0N1K/9XuuylrW6KQljskdOpxuPsdI3l+clHzO9SVgarm1Bnjv3mwnEd24AUKBBJvYpfYS
	cZdp4IhlIuSAX0ZzAtQAorRJfpH5M76+eVrmbR7GDjsRD1KhbF0ESTx0gMRZqJeGP0ALnP22dMFCF
	0VwcUeWigrS0EX9uaK8zY0voWYcGKxBJvG2MXgmGGNATXonpDF7bm1+APz/F2YrgYdL8kbMnwoJZq
	jEYvquEjQT6GuSGM2YHsR46JnOAnhntbn+Doz1JqDHYi9mz2+6SqpgyIPeOa6PiCdq3OgWT9/Qqnh
	zhBhZnXPmHKOdRKdVL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Rk-0000000FGV3-3Muu;
	Sat, 14 Nov 2026 03:28:56 +0000
Received: from mail-pf1-x464.google.com ([2607:f8b0:4864:20::464])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Rh-0000000FGTq-3AEK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:28:55 +0000
Received: by mail-pf1-x464.google.com with SMTP id d2e1a72fcca58-8a60f90a924so691038b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626933; x=1795231733;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=;
        b=QCyQyDUdM2/XQv33/dW/MtzURpXIN0wYpXNhnLYgkIHW7Nf7xxoNfqJ4jZqbGFnZMT
         yNSLiIOvVa6+CIAwx+orovr/E+M2REYbARDcK81xX51UaeR/yCXp4MvR+ZOWikKM+rqR
         qFCADSW9swSAvq2WOQOGbeYW9w3U+s7vtT4b16T0Vj0+tvDwOZ4LStsE2v7PA35YA8qC
         wYcvy9AJ+heu4OY6yf1OVTm1xwWsEiYSFztay3DhEBu+jVdH8b4yld9IvpbSV4CrKizu
         ytKIWtG1MINeIiB9vPN2Lw/ALbI93L0jZ2O4mREQNaTA4X3NwnAj3oBLdUG8q3L5SVem
         ywyQ==
X-Forwarded-Encrypted: i=1; AL+hErEpFX5JAFAWiJDtNZ4zVrFpnOEgOmGjpTbgdJS7lTDG0dsi9XbNTvTp4d8KFJEeyJawYXOZ90Md6lcDMVFihzVy@lists.infradead.org
X-Gm-Message-State: APuU4Z/pmqxEJ2VpEplxQ5OpTF7xLyaUZY6iyHuNkKzgSMrvh1KozJrQ
	w3YyQFSaM08+O+cDN5N/EEGYpOb5WZdaYrH4Gkgw8WQ7D7q5bUUC8LT2sp7kLQNRaA8voNh+6QU
	u8aOazbFAZRK8EhfmDbBw3ROMpBcFp+/+Q2SXQ5LMcRttguKwGjpzwCYUo2r7GupUQz/9w0tlfp
	0VYuAit/04s6bwmEh44rR0Ks7H12i4jDzUHM1qz2akm0/+YQdIiExoeZLxsgzDvFKqluM4bjYYb
	IOw6e/LOr+ol52MX/UPUQEA2tcjqISozMM=
X-Gm-Gg: AYBFou113zBoZwLtypnH8gT8IO53iwWt0unW8MofO/H9eiPqjNKh+JqjCYO7v51vqKi
	ebi/Cdh+Wj5GYbTGTBlV7OsXmyX0HOQNOc42Y6QNh0lWo9k55Mb1MkaXuYqy6mA14iMcNC5L8Qu
	UZRAULo/J2bxF2qrt0b7xONvnzxxvBCy+bpGj8oKrxmWANXAEtQKJedd0xjS4ZvDGIPRbXVZVyd
	dEDoRFmAE0r0+DsI2bvVrydcEyqKTbVqwXiMob2CsmzvZI9SHcOBOakfFbCu9GYS7YhRwXzr1v9
	Wh5UdtcRYDMFNwcxho6ICTc9Wl4CLxjg+S/XCXGa0SGIRgnxH2Yz1VViLFhje6CVvgyM5geoYBW
	iuEovvkWc3cNiBy6tX5YFZhAW/XPmu5PJ7cXbB8hYGVCeNQ2TPdvnaV9dy9JLnf9n8s/B9theJH
	hNisnhT/F/AqQBb8AgAPqc06XI3hZm7xKeWa2l2Ect
X-Received: by 2002:a17:90b:2642:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b1b0b9cb54mr4058033a91.65.1794626932905;
        Fri, 13 Nov 2026 19:28:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm8896505a91.2.2026.11.13.19.28.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1827964c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626931; x=1795231731; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G905XYAjc6fuP5+esWv3pY8cINFOYDYWIQYBCDdTSIM=;
        b=Mh7yOd9SgnOJ6cFDiG1jBAB4j2COiEyO03OWZXCB4Nx4xn8yrACh9QE4fMrIFtlHxQ
         mBBopKuNjffGYmO/+8UuU73SEYNpHLluBmywKgWDHvkC5Sw1L/g/wwi+GEDhvHf2c/s3
         +hPUkQ8k3QNtjOHCcx8PCtqB9FzFhL7sRXViA=
X-Forwarded-Encrypted: i=1; AL+hErEZiAKpyO+GLZxNHyCt68bD+z5rtDk7S9vPyU/QjjKtIq4r02GYl1VjZ/J/2rd/WAubjJ/EvcKC92R/8kSvFAi2@lists.infradead.org
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr3611163c88.6.1794626930863;
        Fri, 13 Nov 2026 19:28:50 -0800 (PST)
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr3611139c88.6.1794626930062;
        Fri, 13 Nov 2026 19:28:50 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm11190793eec.22.2026.11.13.19.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:49 -0800 (PST)
Message-ID: <425e74b9-11a6-45b7-8bd6-c3fa6c66076e@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:46 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] platform/raspberrypi: Add VideoCore shared
 memory support
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-3-d25e3b687e71@ideasonboard.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261112-b4-vc-sm-cma-v5-3-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192853_809660_DD236542 
X-CRM114-Status: GOOD (  17.39  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add support for the vc-sm-cma driver, to enable sharing of contiguous
> CMA memory allocations with the VideoCore VPU on Raspberry Pi. The
> driver allocates CMA-backed buffers, imports external dmabufs, and
> manages their lifetime via VCHIQ messaging to the VPU service, ensuring
> buffers are not released until both the linux userspace and the VPU
> confirm completion.
> 
> VC4 can only physically address the lower 1GB of RAM and requires
> buffers to be mapped through specific uncached address aliases
> (0xC0000000). Thus, standard CMA could not be used as it has no
> mechanism to ensure allocations are visible and valid to VideoCore
> firmware, or handle cache flushes as VC4 can't see ARM's cache state.
> 
> The vc-sm-cma driver bridges this gap by allocating memory via CMA on
> the ARM side and explicitly importing it into VideoCore via VCHI.
> 
> This driver is primarily used by the wrapper V4L2 drivers for codec and
> ISP, where firmware running on VC4 does the actual video and image
> processing, while the linux userspace interacts with standard V4L2
> driver interfaces. For example, the ISP driver populates large
> lens-shading related tables for a particular camera setup, and uses
> vc-sm-cma to share this buffer with VC4.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Alexander Winkowski <dereference23@outlook.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> [clean-up for mainline and switch to xarray instead of idr]
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian


