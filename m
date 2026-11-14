Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752C606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ThjT4lsa;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XVsyWHIF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=; b=ThjT4lsaGRiLCN
	MQTbz7FHQHegtXAaGetmNBBjxQOEgkiqK72X0ehmN3N0PIXBq6nQJQA7WcdnuY34STv31RKgLdH8m
	8aENXSlijhVWGJRR9rr4T0DpLfhwzNuN99f+q7217DtbB4sRdQVZcl+3K/gw4lwPaYvcCl3KaTXeZ
	iBmMsqDOORZ3MLR1zRbk4Zn9s65vAMlnHFG/qE/xGY41H8UOw/xemlohKdLquJAfleZsLgmkCM7oc
	AQq3q35YpQE8Gw8zxJnjdIa7mN52rxTerj/RgL8Irek3mmEnbg5XCaHJ1jZO8hjohR9++DkPBMgkI
	PwifpoMHNshLHhzlzkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4RI-0000000FGKT-0QWC;
	Sat, 14 Nov 2026 03:28:28 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4RD-0000000FGIn-45Yh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:28:26 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8774455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626903; x=1795231703;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=PALYrUyItWLSyCXaZa8MQT1bwV5h5Y47WFFH50uDteq55EDSiCl6iwk92SsSOLLslx
         hvlvOEMfgQeXh4h5lnEnSWEf1zo9RPlpfyFyIO9SlN0idTJvZ7ik1/0DhnpVCtrMsHyE
         28r3esgCQ6kVOZC+/2tGjFRFojv/hV2LWuAnkhrqRK3oTeh2CusS6clAbg1ZLcziqlwj
         GOmUxQbwQQsw1K69Yo9wLfiNZtMujsmINLRq47Uso3zLJ3AKXVA7TcctKQCpdig1JTE4
         Rf5o7hYyEIs1TPz2rNlpkneiMrHjjZsAZpViN5/e6qxJEc70N+Tp5BKfp3qu7KvzLECk
         T4dw==
X-Forwarded-Encrypted: i=1; AL+hErGebEdUODsnK/i1JH7I5iSP4ciQtfxcRradgyM4JLfZBwdf3PrZjNAWZ9bMIgVsqM3XFkCXJUB+qpukw+vtoISo@lists.infradead.org
X-Gm-Message-State: APuU4Z9a3aySEGi5uWj/Aoe1Rsi0v/XxY47IdorAlqKChIB9I8wnLb/Y
	GxwOtBKWwcAf6QO1k0JlRuTougCF9yiQDHKU4fu3DyyI0DsbtINJse9329ktjJQkyYr119Q531J
	X5aSCWS4hgMD21VShzXR+6qL9pimob4nUDIedlEVnF7gr2J5H8wW6vZn0O7qDxxRFr4vPqkrZOr
	nLc3p9/UbfwBDzPyd4VPnv90Llaia+lu2KTfOuVsqbg8q3A7DHwLIo7f3zJvtvbGvvZGZhAldyM
	RqCZz2mt8jrQVLXhv+est3U5hkLPxLDgOI=
X-Gm-Gg: AYBFou3AG7ybShg1xfOP7eJQaGRTdNxj0PR7cvqqYuF4mCOwMprXH1N7F7pJl8Jk5S7
	Z3Ah2gPtCWY6FaaSHgT0/Mjwqyuw98X9LqMbUg0478+aHv0qET5M6DURnalyMNweCNkBeU2Mxl6
	FKiDIl6CF9SURNGHla/R1wVnVx5QLwHZG+m9hyq/BEGtLtNRgziFvNdunq4gjHy/4pgvn9X1873
	O+ONGSrz3r2DQS3rtKRn75FA4dIhZcixrgksPOA7ggTMS4t0rntiStnqVelM8853le72/IrREUr
	EukjSwGJPVhHl+sETy12ar8DXhai71mWJLOKsbmZVvgrYlSt4UTXie4fc69uR19O8y3f8Z7b7a1
	zm9sUcKyrN2/vShBOD1ykiPp3FCXN/st7XvFYUgjmUzzvVGaODfk+80lJQF/tbVnv
X-Received: by 2002:a17:90b:1d46:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b1b0a4dd29mr4385141a91.39.1794626902717;
        Fri, 13 Nov 2026 19:28:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm9241136a91.0.2026.11.13.19.28.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2071374eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626901; x=1795231701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=XVsyWHIFNt8fq/B++6va4KvYNeqJ2I2vsR1iwsSqI2D2V08iRSU/MHcK9oaNkLBoLq
         XOd4lK1mEyFkyx3vhxd2FjYnipkDe3azcX+lx5DbstMYoBFFGzMbR9L+2uvAbiYawb7c
         LSp7qIqzNrYqDBM/69QkcCsFtFVlwqcAdtbsA=
X-Forwarded-Encrypted: i=1; AL+hErF9cKImYWpa5ej5VIBmK6vx6OWMj14SV8VR9jMgu3XoBxaV4e259MwpMsbXzDEgwQh2z3dub4NBMA9c/p06y5D0@lists.infradead.org
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392579eec.26.1794626900935;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392538eec.26.1794626900216;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11415865eec.12.2026.11.13.19.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:19 -0800 (PST)
Message-ID: <fbf90cda-d622-4cb6-b576-9576800534fa@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:16 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
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
 stable@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192824_021520_C7A824C6 
X-CRM114-Status: GOOD (  10.85  )
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



On 11/12/2026 3:17 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Should we go through the timeout failure case with port_disable
> not returning all buffers for whatever reason, the
> buffers_with_vpu counter gets left at a non-zero value, which
> will cause reference counting issues should the instance be
> reused.
> 
> Reset the count when the port is enabled again, but before
> any buffers have been sent to the VPU.
> 
> Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian


