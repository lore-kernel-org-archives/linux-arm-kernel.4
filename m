Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE388606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOYmvxhE;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gsV+REGE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=; b=tOYmvxhE1acJdX
	aL3DT1id6dspoHRRVdu0KGhsb+jH5hXiVMXrTKKsg4X5T8En8RI+rrnxPgthCNOHXFfWj5XCAHC++
	oRBasZ1ZgulqNBB5cIDqhO/uBa8awPsSo7sdOwvEaJr1jFalHJZpJTQPI0Mmkd692PFVwMVqyncK8
	5nlTydhIw3kBZcaXH1gIE2RYpcw2SHl44KePIP2Q5p46kec7a13EsN65i2UUcLaLpCzI1Gs5Ep5A/
	vsTnOcyu2OBwtfYG5EnJ6aA9G1JdNgU/Vg6wqY6xwUSJ0UNEiZVRkTPHemrlYRTiQjrKkpyqjLK7f
	pZaHojIZ5//QWa0mTpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5je-000000046Gl-2cDA;
	Mon, 16 Nov 2026 23:03:38 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5jY-000000046Ev-3tcU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:03:37 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2097970a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870212; x=1795475012;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=;
        b=lPwV/Z07Z+rGBCB0GNFciWZ9aeoqZJBAv8jnlZ0wdBgFY1x071LD9RKbgcOnQRdT/G
         lQQEB9MB278DbDkw8eoA7Q03SNwsw4G0WASr0ZErtI7a1KDBw3PESauKpW+0OcYAxNCy
         jWOEZzjhea6Vm/smqBkw4QB+MRx14Z6ZPfcry2FbNPQcgS8bD8ErioWJY482R4wk6hee
         ICn/SiYHAPsAaJ7t1KSd4YiDK5X4X5qnyjF9xbQlhyp2a/+iS8z6eHgNAAdrTtWUP2zL
         iCppRMqH/S14PDqCpgnr/e4NPdilITsJOhwAlD2wjn19rL8lBM1zlqH0loBFpOOSAL1a
         oXSg==
X-Forwarded-Encrypted: i=1; AL+hErE7ocVSlKArSi65mMXIlbJrMGF/q4bhwJ1qazesIFlvzLf2BDdBy9Vmay2ajs2nG+8qdYhn4fD4CWrG0Tju+0hj@lists.infradead.org
X-Gm-Message-State: APuU4Z9MZ5d1gWwrWDlI+umrrdwVp2hM0RXLDfQ1CSWHnZTOZpMFqphU
	+eUqLgQ9rG0KaS2AxX4gt8t+sB3f11dGZlZ+TYoUw1dIfT2TreqquOEUvLddWDTLy2MGrXeKUM+
	NDSC9Ox7VweB2toSrQVXbBf48Mh7om9IiUR9X36iqfWUwC/cQlwAxC4RZKuREBYlzvHMzLijiQZ
	DeYK33AF98fF6vy6wugjZZCUc6HQDaI51qMqfuH9qL6ofnY1vuBZ48syz8K+spcDpfA6DgF9Q3Q
	HgEtgUaGOqWJyHc5uwG+AOqwnO2ffimwnw=
X-Gm-Gg: AZFdTZcpRzWgvhX7Jfic8v4CzJQ+A0AEfqR5lAUzKkUVtk9IBd9HHdgPoDJq4CzrLmV
	4ruqJlj3ljrjbMzZTS1VvKj/3KwLm/0CTEYaGkPjDXlAwsKeSmwmAxnP4m5nEahrsbAs4HszqS8
	hZBgcDx+Q5ejGrHNHRwxckkS8rT8i0RUGsibfqyOjT8dCJ/rO/Z3EQHKNUssPIwAT4B4+/hqdLT
	F+YFUzwWfsmnTrdy9GWaXg0Wg8d1B8WEF+foLVIRs7dsJUnuJl1LLnjJmyoqWvSYkBkiHXaoqbB
	DEQ5YIMna2mFlniF4LHg/KkWtxepcoCzz8oqbPo045k5j4L/r7p8M9P1P3SvlSUfGrkprBr1Tmv
	HgHjtArxOJO24FmV8gl13HqUGPiZxnTBZQSUmex7S0KMvkwos9T7gtMqITQbZKeGA8GzOTAYSo1
	aVwMdrKwCCbSye2Dc/B5M3PDyt+3x6/CtITSlO2SX5
X-Received: by 2002:a17:90b:1dc7:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b1b0a23db5mr9559701a91.34.1794870212162;
        Mon, 16 Nov 2026 15:03:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3b3b41e1csm82866a91.4.2026.11.16.15.03.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:03:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso3643155eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870210; x=1795475010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SikvGO+o0scab1X/xGcw4seKCWg4eNvBhS3ZiTaMnic=;
        b=gsV+REGEHOHbGsVELQk/k/baj6T0i7iTF90GRlL6/hoxzILlJlpLJ+RfJtEmzzJwSR
         bnovAkP0bxgj54f2Vicykv5QxaREtcZ5YB9SF9Po8TmuLgT9/4yvLBykTCXORaTTosic
         IiJhZucyI2b894EICTl/ZzNXzdH1aJSACVz00=
X-Forwarded-Encrypted: i=1; AL+hErEU2Nr2DJB6+sUG5Imp3A0ow+Di/YTQ8mILdfgygJULkiARTxr/TZ3IpQqBqepEan7S6cQnRguCo4aCd4a0sgx6@lists.infradead.org
X-Received: by 2002:a05:693c:2801:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-37967ed6d47mr10641738eec.25.1794870210449;
        Mon, 16 Nov 2026 15:03:30 -0800 (PST)
X-Received: by 2002:a05:693c:2801:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-37967ed6d47mr10641717eec.25.1794870209797;
        Mon, 16 Nov 2026 15:03:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm73366441eec.20.2026.11.16.15.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:03:28 -0800 (PST)
Message-ID: <dec9b468-3d8f-433b-aa72-e207ce393cc0@broadcom.com>
Date: Mon, 16 Nov 2026 15:03:26 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/raspberrypi: vc-sm-cma: Fix sparse and
 smatch warnings
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
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
In-Reply-To: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150333_232185_F5F8F7BC 
X-CRM114-Status: GOOD (  12.28  )
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

On 11/16/26 05:32, Jai Luthra wrote:
> Hi Florian,
> 
> I've fixed the issues reported by sparse and smatch on my series that
> added shared memory support for VC4 based peripherals in Raspberry Pi 4.
> 
> My apologies for not running those checks on my machine before sending.
> 
> As those patches are now applied in your tree, I have added Fixes tags
> using the SHAs for the applied commits.
> 
> Thanks,
>      Jai

Thanks for the quick follow-up, I fixed up both commits into the commit 
they have in the Fixes tag since this was only in my drivers/next branch.
-- 
Florian

