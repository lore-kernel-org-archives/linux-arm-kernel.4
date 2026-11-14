Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237B8606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vpYO7Cgb;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=a4s3xqOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=; b=vpYO7CgbW2K7BV
	VYPCjM0yNtCLCcHEuVjcEVbV5CBA3XQgVVjKUZgHVa8cGMvMbLi2kVpqHFMzv7tX7ZGot/nxxuHNp
	FPaxICv3OhrW6VEKZWzIJYTTRmV/sRlM/GgxIFoJis2KGzYPYo4mJnVCFdhFMNocmzpM9mud6OCzd
	apu1ypmentobyEl7WJd89WZl6SrWAot6HK3p5S4NwG/PLaLakEut72QeUFECHh+vS+8ZYidCaJazR
	1ycg+r4dOf/j9tsjFeDnFTHAUA3CKewdmdaP3Cv7oONxEAxb52Hg1majcjNrMCvEJvUuQOk6k6kZR
	Gkvku93xlPSP3GhThpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Sm-0000000FGoq-0shN;
	Sat, 14 Nov 2026 03:30:00 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Sj-0000000FGo1-0dPY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:29:58 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1383748a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626996; x=1795231796;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=L25TaWOHf5KAXAshoX1xTNPq/iwL+kpMCu7RYb1EuOuFZ1G8ltIe/UfTd/qoGI1tsa
         j074lN3I/ZKH4202gyjpv3rs6xeymQLeoLqCrB07Qx5dDq+msi/PyDdUJN8+QD6ehgLi
         pOnwlzYpnLuD6Z9X9unyUezUipzB880JAtVP63b4QA+kOh/ZVN7P7t8FPHrZjEljL6ep
         SOZIsI4Ao/UlxeN0fC9QQaPn2ClZm+cEK9UlBiLohVI9PRb9YAMz3b6+eOiiyr+e+yra
         IhHu0YX8EelVvVAez7TlMETHlNefOAFfF6FCr1Xn7Ax0iGmESRMlt71jMsoGL3N6zFfC
         7rjQ==
X-Forwarded-Encrypted: i=1; AL+hErE7d1vi7q7qoX5IVqxtVtakUflf+bpdgqz+Q72vwl8wAs5ETuQUC0WIDQ6iS4mgvw6POQ3Ur8DIeZIviaz3Hevg@lists.infradead.org
X-Gm-Message-State: APuU4Z9GRz89ry7/jQWdn8uWIkczRYZ1ryXLu2+gZwCdlUEREaSy6J6O
	TbCWa3NsCEJ70w2MLW9lCVCSs/S5Mf+yJPziMMvPkiQ+dnKYenZADb7m5pUBqOieefEa/ifdX9U
	NUzQzgCv3bXcZ1WAiG870qW94h4JcbjMdHZrG5FdshYMdX+GIkUCnUp+vTeDBwsEhzWd4aG5QbO
	PHlzc3jJUQqYvOcA+gxBZIJXjy+nSKP3lMzTG+Dyff9oz2/8Mr25hJWdYITfnrO7rwwP4FCIgXb
	Q8DZ9afpc/TJ5wCtYh0pnDVMpS4Qo0SfVU=
X-Gm-Gg: AYBFou0N/GPJebUnppD6eGEdVDTvM+itp6SNVmSBwcT5bESm/seEEkrnSs1lTMVOXDZ
	PvgWvDfGD2BouKleV/RibKvogXSR3FpRxx/NfCPCX6Wf8EBaJoK8hbph19tPr4t2cAsk6QGyZ7T
	94F/xPcPMw9y+qUHMHOa4V5e+8bdfWHLwI6vqk6nUQQUYDrsV7yJXlbtb26hnu/1XkpnLCmk6YW
	/s0Vg0a5AfH4WcAqHqP+jQMImLuSH29wG/PgMbkuRJrJeDS95n87iNURPN9tnLKr6Ln06jlm0Rf
	6wC9h8+ujzCO3M77cOD/Mn198EkYe/KAVATnGE2AzhUhC+EOaRmIjfnDf53UAeMo1VZGp/tojZu
	tDDvwwwoE76gUTH65o/m3tiOU6Fudq9ThALKtTe6Zlt913UlhOsRUOFjvhsVcpWckBzzk8XXd0J
	+hIYJaLVHLnoLaL1XJh/z4XLUeV9gGhuwTFhbjwHpR
X-Received: by 2002:a17:90b:4d0b:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b1b0a48f95mr4018407a91.46.1794626996234;
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3af131bsm1719241a91.2.2026.11.13.19.29.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2320591eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626994; x=1795231794; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=a4s3xqOWCUzomECuxatBNeKbjf6FnBjL1u9KvAzBmvk7MpT3ZNXLl7pc6H9mh0v7DC
         NWZy/wDGH5tBf70S4p89EOVCAjDcRUgTlvhST8N94HID03BizOc7pStMVGKcfq/GQfR8
         QOQ4xoiWuDYphvP9wuWfqHU8/MfI/rBM4KwKI=
X-Forwarded-Encrypted: i=1; AL+hErG/YuoaxNiGPl5ysCzjZrZzxDp8rKpe1tB0E6EKzV6HUveoecd+7QHW5GpZeyjiR2KK4nqFs28IgJM0G/UNv7tW@lists.infradead.org
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676488eec.25.1794626994165;
        Fri, 13 Nov 2026 19:29:54 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676459eec.25.1794626993492;
        Fri, 13 Nov 2026 19:29:53 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:52 -0800 (PST)
Message-ID: <beae6d07-e25d-45ba-bcf0-39422feb3295@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:49 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
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
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192957_200036_0E94DAD7 
X-CRM114-Status: UNSURE (   9.20  )
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
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to mmal-vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian


