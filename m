Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5006606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sUGHMsm3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCqjw9Ln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=; b=sUGHMsm3WJL7Sw
	ba68ouU7utbzOGOGZO2UgRffcTFy9BSrOPXP9y3Ir1r5Wd/pfNOqyFuzK/DZwgN1BYBxIj0AnXR8U
	hTHCUg9NNeXxQYNY39aKzhLFoUc7IpSdrA2vIGoD1rQQGP0R2UWAoziAjyQEjGueG3UlbjvaTjYId
	p2U7sjbgXNPuIZE0IF8TAjwKxnRmL+mbCFCG88Dx9RGMToS5txYNVS2rrOnrfezi7+58pHqeKBZ6q
	Y0UcZldQUomRWRpE8gNZ5kArgIvmjdP4xB1wL7oxeBomT0mXaXJcPSc24kYZ9EPKCbsNv8QY6aFZF
	lu2o/XAXZ6z/+jMshmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTk9-00000009q4b-40nP;
	Thu, 12 Nov 2026 12:17:30 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTk1-00000009q1J-3AxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:17:27 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso397514a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485840; x=1795090640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=cCqjw9Lnp6HkY3hZ3q09Fch/jzvm4Hgaf1nPUl1jqDt2WZLuTmFxX4koNjjkC1hrQw
         4X3bzGPkVN8qdmalWZO0XlmoLiAZvirLdAEFV+i0EXC24EzDNHGgoKFfX5N8E1uPQZ0m
         350q9kuplYgEXyWOlGR3UtLelKup/TxP6brqKpJeo9bSEvc7rWuaiWlzPP3BC8tunvKh
         BzhntrdUaGnxdUkmX67rVJT2MOIPVAt0mza/yAmHXvaR1aEycejk7aUCdicsRzfTSpKK
         fJdMhK7NJw3Hu+8Xt5GS94tNNthTQwWVP9Q4oj07u1gr1TXg+L3b3+X/mAaT0NpJsNSl
         xu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485840; x=1795090640;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=jNBMtaj2CZbeUpyFkDiV4e6tCWG1XFW1bCKi2ZhmFyDixIp1NrDxyJIvKmqBSfuMTh
         Xd6co/a2FqKCf2Sy8CESpJv+q53BLP39lBF+zzSOdm9mthQXaMYscFYib9alztAetHQ9
         qn2eA8LzYeQeOAteDN+YTSJaokrPhZ7zleNSoM+QD6bC7797MGepAeObmwIo2vzcdE0j
         J3I9gPDeBtixc3H/z0DEV/qMgPtNfOnc3h7O0PRYgfdkOJZCesvPN+id3QJThV6g5oNH
         nZwAU9PyOEsRqD/5NVKH9shcWpe3K9tdvgmTxiZurFz4fj7OCV/VcNSvu0MGTzEkkKfK
         PxXA==
X-Forwarded-Encrypted: i=1; AL+hErEeFBLaQ98Lg2yrM6Pge5tz/XXznu6yjmlyF7lCqdmY2xbcZi9cyxFK0soRdxd0lKo68mXwobPwv3V8/FWf3FAi@lists.infradead.org
X-Gm-Message-State: APuU4Z/tXLDrw9G9CxYsxAxdT5XXiCFpkoB7mz80T6V0HmMaOqlRhPMj
	ZQ75+tXT7fYAz7DgVtb5NX9NbX7C2tcYSsYzMaZNY730neRvF+WpNhgv
X-Gm-Gg: AYBFou2cgDqRpUKj993QsSCQDcSjlNbBT5QNkuQw/k8XZ0vCIc8ky/Kf2tnXc+7eJpn
	WKDVbFlDAswj7/uFZPYYasa+DEfPLHNDb7evc0PO0rh8AvIsUqtUuPIwqAL6AWpEZk2Dhrsg/Ni
	DfqHm0tTxfYTPGfJCj0HjMks5mPMHy8vi9/REILESeFEqdU5LDJl2o7wCOT/4sfhDhf90rfV7PO
	sf5ca5+2MYCO1zEVhe5H6iIQZvmmv2h1bGTS1ETGso3yQR0MxC/9lzDOAezBzKY53mVaC8h3sVN
	0DD2J9JJ+e46PywMHqh39YUZmLVUE8R/W4KqlyqadyG0SAMSenRO8RYU6v8YDJNKTrQYyC8ewjR
	tdWCahPhRNhuoEQukNlvsrIspeCe89mIEc3iV7Q/5Z2WAMv7aMHy/ToPJU39L9t03u1Ig+Nj3ub
	tzxzaAjGhBfHkeIIA0RARjMlCb0sVkNW3EgX8aYp5zDCw0W+QWiYTBQU1IwQApl4MuC1hnjs8Rw
	Mspmj3MYo/DhEv0bn0m9ra4CCzw8+65dZk3mMfbGmi0NePH4wXyYdLbWwamNWx+0hOBQpiEJC2R
	51qsrdJq8LaHXik5cHmPjQ==
X-Received: by 2002:a17:90a:8c12:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b197c81815mr1116711a91.1.1794485840292;
        Thu, 12 Nov 2026 04:17:20 -0800 (PST)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm4489297a91.16.2026.11.12.04.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:17:19 -0800 (PST)
Date: Thu, 12 Nov 2026 20:17:14 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Shawn Lin <shawn.lin@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v13_2/2=5D_phy=3A_rockchip=3A_naneng-?=
 =?US-ASCII?Q?combphy=3A_add_SGMII_MAC_selection_for_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <avV77eoO96zacmoq@parshuram>
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com> <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com> <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com> <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com> <avV77eoO96zacmoq@parshuram>
Message-ID: <073A7037-8E56-4B14-BBDD-DA3118970086@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041721_809566_0F6ACC95 
X-CRM114-Status: GOOD (  11.68  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On November 12, 2026 4:42:21 PM GMT+08:00, Vinod Koul <vkoul@kernel=2Eorg> =
wrote:
>On 22-10-26, 10:32, Coia Prant wrote:
>> Hi Vinod,
>>=20
>> Gentle ping on this series=2E
>>=20
>> The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
>> https://git=2Ekernel=2Eorg/netdev/net-next/c/5e91edfb0e45
>>=20
>> The DTS changes are waiting on this PHY binding and driver to land befo=
re
>> they can be sent=2E Is there anything you'd like changed, or is it just
>> queued?
>
>I dont see the dt patch acked=2E=2E
>

Hi Vinod,

Conor Dooley already provided an Acked-by for this patch on Oct 7th:

Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>

You can see it in the patchwork thread here:

https://patchwork=2Ekernel=2Eorg/project/linux-phy/patch/20261006162807=2E=
2843858-2-coiaprant@gmail=2Ecom/

Or in the lore archive:

https://lore=2Ekernel=2Eorg/all/20261007-9753b5de7344a15472337c6d@squawk/

If you need an additional Ack from someone else, please let me know=2E

Thanks,
Coia

