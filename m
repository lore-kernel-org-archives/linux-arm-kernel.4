Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE3606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lXyDIeAI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Urw3GH+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=; b=lXyDIeAI83lDQq
	JzTO2Seaca/JSEGH/d3afOoCx6KqJZ/SfIVD2IJ7ReaTJE7pLAJsFF/PkZ2RwaL1ya+J3YtUhVuGg
	WC8WghT6ctxCe9mnoELDBAVD3ErElSkmpQe/1itbxFWvdKHxv5aTRZjEM7sKoqk6Sitm/m9k3vbxb
	AWbLpz7JfUFZkLiSMxOZbjMTZnCuWTP8iICKEVgvLt0GcIQ01jCJ63ZDrmox5SyJR3O+s9t79IYr0
	k/brVwqOOdpyHnp6G/poJ/wLtPk65S/du0j3u/AQflfDm5HJxLSRdj/FsPgGzwlt3OfiuB/XWZxPk
	bRf8+NlAxrnr/VlQDZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYO9-0000000D7sF-21x8;
	Thu, 26 Nov 2026 12:15:45 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYO6-0000000D7rH-1J5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:15:43 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1b3acec6677so10532565c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695340; x=1796300140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=;
        b=Urw3GH+mpHdUWzbVsiVyUlEVeHp8YOH6M/eBWcbccnLVMBshEEJ5e9ZfGYR5bZlj51
         oR5hu0FIR0zJeHMO4yG+QfAtNA+0UWs4j8j4iI5qzcgucHzAD24ax3pSxSy+fAkhXxCq
         sMzYyEH5i9L2VboI7mOlopVqH6ErzOkWBNnWUNRR9vBcNyrV/Wy7RvsRRPFHzeaC0zql
         R2+Jz4PQojCtnHfhPLODTLgOwfdVRtAG6PZHDk78DVoxtaPD8+eMjkD7p2bbwpykN9aM
         6kfSzQ36i9fhPvNezYEayarcUbTk1y+L3zrxDiW38r6PiAMJgFUz9LN/NfDkTy9nIdbi
         euSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695340; x=1796300140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=;
        b=KFvGSmVE2SaAdPQV3/XXoE6uqdT2zRAWj/QIozO8KBvQPcNCoJQGq1aiTmvjFe4qvg
         cqF0LJIHLyBscutaZ7Shz/BAgRlFOQV42nzwG3gdQazwULID/C22i0O9bFjAcTQ8/FsH
         qB4dgLw7x2Af72xMp66rreynFQLrOtB2ZO5q7SgBbAji/F+ttXrWgRG1dr37OftACZtz
         b8W65QBZLGgi/TiWqN+LsYmny9aNPDuj6k69rMtc67BLfswX1TuBxDNQ0iLX65JcH4Jr
         fUeJervdhgywnSCevx8v/UDZS3g36I45wAVRX0/QG1dw8Y/JdVMR+J1jdCLEIubbEbYK
         4hNg==
X-Gm-Message-State: APuU4Z8PKasdlZzYELyMcg75/CwFMWaSA9S+B5VxhmePN9ELyJXCXODP
	v+45nF0tqgMEhz1F3huF/fDErCR9NvSd/EGwKY3ZGHoxXPCwkv6cR23onArwpw==
X-Gm-Gg: AZFdTZfNgmgr6EBwZuR5/BoFarLGC9ogbHKOs4KrseKxfmax3GAYWYY0ruufr3pRydN
	GpxlOn5IdBh38Oxxhm0+vLrGRpWHfdIDE5pqaLsZSqsOvicg4UsU0xprIyNfmVGgM8qsEPFd0xV
	GkSzSTPHtKGkhlPqGnQAyHsh16r56/JXIFRAvktCZsfxnKf8pxiUnXUmUDx1m3w4hDjB8s3c4Uy
	8W/8U7DJn0PvRSzLdxU4n1IW5noLOAfqtXjSmUclcKshzQgUpLJwW7zxTS+zOum7xFvTTsCoMwZ
	xMpEs4avvd9djqnSUFO40kj5DCDvG/QOQSbG9Uu+Ez5HI+cAg3724cQlxTeN85mVzXTsq5q+nQK
	2IsL/9dZW0nN7ldcfq9Jexjen2t8IvgJYoFLlEMbJpsDWCmcYvMwH24ppdsQN2naZGMjx6JPkUo
	QLOrNr9dUzYP241gjZ8y1oq6/ClNrUphJFt8IAFC0a0FskzPtWvslDV/IZuxnjv03K6FWy2WRly
	m/1YVPOutSiIjfbX6xvCc375sWSMPdUm/OGjKiUbl/PymeYhUq3bLJMnn0XO8erCSM0znI1iZJu
	lNuWkbMfFRxEjAwWRMrPgu9LqLX01Lv03Ro77cDQSLmvsKEJ1TI1fgccyaOZYiTGRCLYbXFI6oM
	W2MwbWbKfo2Z+pfA=
X-Received: by 2002:a05:7022:b051:20b0:185:b157:f271 with SMTP id a92af1059eb24-1b5568e30b9mr23372593c88.23.1795695339724;
        Thu, 26 Nov 2026 04:15:39 -0800 (PST)
Received: from [192.168.151.216] (115-179-187-167.aichi.fdn.vectant.ne.jp. [115.179.187.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm58188566c88.5.2026.11.26.04.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:15:39 -0800 (PST)
Message-ID: <de7f36b9-1ea5-4f48-91f5-dda0146d2e1f@gmail.com>
Date: Thu, 26 Nov 2026 21:15:37 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Vladimir Murzin <vladimir.murzin@arm.com>, Brad Hawthorne <brad@sim.vu>,
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
 <20261122003911.1203777-1-brad@sim.vu>
 <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Content-Language: en-US
From: Yoshifumi SHU <envzhu@gmail.com>
In-Reply-To: <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_041542_362119_2D0AC349 
X-CRM114-Status: UNSURE (   7.06  )
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

On 2026/11/26 18:48, Vladimir Murzin wrote:
> Can you or Yoshifumi send a revert for c5e0cbe2858d,  please? I admit
> I overlooked that base already at offset 0x100 so I'd be more than happy
> with revert.

Thanks! I'll send the revert.

Best regards,
Yoshifumi SHU

