Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcrc3CHq;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HRCY0HAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=; b=mcrc3CHqwKI1xE
	n6Qr+3f29mSuMRqjMpYOji2cBgBPEyx4CXCZv5AstKw5CDH13xancuN9PPQ1VVRUCfM3hlDYrlD4y
	F8vUXHJwOcNXxaD0jA4tIMhqyfObd0n+R20NcXJ3g4Y6vgtNixjs1AYDbGQVNGnf55g++k9yGSLT0
	Zg2Yjx9q9GkQxkoSWCsmepGS/PSW9uqbpI6iiOrN8UfL31ramrJTZ4jRT5kqJvp+lP2elTXhlPyV7
	HeMQ19/X1YM2GM5tBTqDNtUoW9A0rKU1U3k4rNx91Gao6/hv8vb3ln3dj04IMGzl2DCKcu9gk6lfN
	CBg5+i0JBIq3VwCRmSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB8F-0000000Dd2H-0XKj;
	Thu, 19 Nov 2026 23:01:31 +0000
Received: from mail-vs1-xe62.google.com ([2607:f8b0:4864:20::e62])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB8C-0000000Dd1x-3IQV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:01:30 +0000
Received: by mail-vs1-xe62.google.com with SMTP id ada2fe7eead31-7a6e560f580so186383137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129287; x=1795734087;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=;
        b=0cAJU6fxE9kGbD3UZXL3i6Re2EDpIEq88txQznZd2o3Kh1iYq1+/+/MQ7TtxLysjEI
         dQ+4hPx6j+2DTWF93lg9lMQlY63Il+oenZreUJKmnXZk39Voxgjw1fCyHdpyO/8dCFRs
         qYx27ZoY6Pi2YBGHW7Ty1FDyqRQfdfyYN7I3c1sH+RQ8CpRc0i3ipLVoUDWgMv79IBle
         hc6k7LSoGs9X5/3gKV0azvaWPbgACzCXdeuRdVkPEhL6ikd0hPMKpRwSCaMrmVhlOXoA
         pSJBqUWGQsJ4jqEp40Fj3CnM2txrcnORzjv26xcWy5OhKC8UsNUD76RREepJ7qpRBkwm
         qyvw==
X-Forwarded-Encrypted: i=1; AL+hErFOeMtNiDdX1EPjInrh8NWVznRNM5Xcg4S1tOlmlXFGZUebdG3pdAuUChIPAHaAgGdngU2SS0NpzqG1frZd76/K@lists.infradead.org
X-Gm-Message-State: APuU4Z/DmAgSbKVyLz9/NIo+rrVw/sWrr+eUQHzl18YgX3XabjwGjt/s
	pa//TUe2OIymPAOFSwnt3jzPw1inVqz8xPjPVz8M3C3kCkmozXHHyJJK7UVK+1iNRn6R2DTS8Ts
	0li7J2kx8ctHz3PuLbM4zkI+M8vpkrkfiHwLVKRifRwM6dhhk72llxeKnmZPrG/q+TRUBGggFWK
	n0cFtMVjUXPQAefVlNPjoNF5M1DaRtrmX5slTjiB0ZC4UQoueXwHJuRMc4hFBcs1cnLF7TNi1ze
	hT0c7l4bsQ/NL0O7QpnLSJoP1ZyESeGor0=
X-Gm-Gg: AYBFou1NiASHCed1oXaFjBCEga/PMlLiNP3B8YFMwDMnZEz/bOurujJM/S0XowMsKNw
	VjenneBwI9PSFJ8Q0n+2LX6OEfkRvB8DvNoEU8VpFfbjHsCf4LUvKG+yvYw5c64iV6LeRcwgDJn
	UOhtoH4CT2ryOyJAnyvYaJvGcO4P8hvNtygWihmyp4wFfmOMpY7uK1Axhu3Igu2Edtr6Lb+FAGY
	+bRuKC9+0CbY0t1BC2zDBgFwfJArWwbvAZ1vTtDfntUPRG0oYxkvvBrYRjQhcqMqyUbogSvDz/S
	JW0Dz8G11v3NsEg4aOCiXy6Ib+CFNev6374txacPhefk1+FPtGV6A6c+T0k/u47Ta+J516Q3N6t
	yzKPMQRk4HxXVb1mUxjLaYEBKzdJ05hOYwIXeB6thvCDwN8lALpeOT0vN6URNDTiFRONO70J2Rg
	wFkXxAwhHMJgkn8qpnGYRkULcjvah3uYi4Rkz/ZWiNSRU=
X-Received: by 2002:a05:6102:6a83:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7d71e35b5demr543323137.0.1795129287000;
        Thu, 19 Nov 2026 15:01:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9213483d908sm93266d6.6.2026.11.19.15.01.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:01:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4fc2d32caso4745357b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795129286; x=1795734086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=;
        b=HRCY0HAVf6JPUBX9KwxqAXMDs5B5C+sEVxUvljNLqYaSt04uAVdsSR2fLy9EI5y5St
         w6NPZP6Ux4+Sq5GvrFJCic8+hLnXS9A5bfr1quiBRzkbO1JScS47lERYm0NImWwVHlii
         iVHJ+FgQoxrQn/eFf+UZ+Z39YrAkkJscJU7kM=
X-Forwarded-Encrypted: i=1; AL+hErFBpTs+2k5zGhP0kHxpKKVFwpPlm6gbyIk2F8E3tyuNcsUXvsi9005hbkPqLShX4EiUprLNgXXf9QRfRh+U0hW/@lists.infradead.org
X-Received: by 2002:a05:690c:b1b:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b520518663mr5353947b3.100.1795129286148;
        Thu, 19 Nov 2026 15:01:26 -0800 (PST)
X-Received: by 2002:a05:690c:b1b:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b520518663mr5353677b3.100.1795129285587;
        Thu, 19 Nov 2026 15:01:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm63564185a.39.2026.11.19.15.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:01:25 -0800 (PST)
Message-ID: <358ff773-050e-44ca-90a7-a2510fdba288@broadcom.com>
Date: Thu, 19 Nov 2026 15:01:23 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: brcmstb_gisb: Check required IRQ lookup results
To: Alex Guo <alexguo1023@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_150128_868502_2871C8E9 
X-CRM114-Status: GOOD (  10.48  )
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

On 11/14/26 06:22, Alex Guo wrote:
> platform_get_irq() can return a negative error code for the timeout
> or target abort interrupt. Passing it to devm_request_irq() can
> replace the lookup error with -EINVAL.
> 
> Check both lookup results and return the original error before
> requesting either interrupt.
> 
> A similar issue was fixed in commit 47c3e06ed95a
> ("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").
> 
> Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>

Applied to drivers/next, thanks!
-- 
Florian

