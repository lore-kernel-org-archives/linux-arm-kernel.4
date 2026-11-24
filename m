Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2904606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWWlkPNP;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LbIH1V8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=; b=uWWlkPNPtHYnjO
	8NhR0K1ZBwdM2oKZECGTNbFcYrnS3jN89ObMK8Fs+e1c7j3T/tbSnqjO8382iGgTQ4gOlG+Fj3N91
	B+yanp+ZP2PTb6odyc0jqCtr+Fr6uZ01eau5WtNdie4jeZp6QyRmJfh9sYlxC169LCyYN5uIjVNvi
	hcuGoxkykCGTy+491/PhKXOP1eH5WuC8APQ5b6SMItoUYKFUgd4K0V0GA7KNAuQmcIcevq3c4qfNh
	mrFuuGTg/mqAaTgMU9L8G+FaZhJDCYhL9zSYwvcIfVTCt/M86KqR9AGhMRE2yn8z/q1XQGUrLPFrO
	IkGjiZQ+g+X3ooJ39W2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnjG-00000006DR9-1kh6;
	Tue, 24 Nov 2026 10:26:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnjC-00000006DP9-3I6G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:26:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-491846221ffso3661313f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795515981; x=1796120781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=LbIH1V8PVKarcyH39Yj/945DLWxDGWzn8c62W2m5dNEuXwmQdIg2GqQ8igO3Grk7fD
         J3/J88dGGxMmhPFEsYuV2jQK8i+2Bsq96v/JMcmcu4WKyuYCXNjAm06b8NcXUUWRe0vG
         UlVtxh/lUQyucdoJqgBLB55TgqNDS9Z0Aqd/j1dBQdsyC0Z41KJWulk1ANOKJsrD7BNB
         NxotXkCqqHHEZtYDOoitqXnr83Fvl003wl6uaKtwAszPhO+H7fGJDuENTzVAx3qYbq0h
         IHx0DcjYwgYFIRhSY0ITOWXu37PVQeKD4WrxSggAP+hit9LA6mJE4sOu+ZASisVZNjeJ
         mPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515981; x=1796120781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=Lf/j6YqUlRiL1fCsL4L7+RW7Zwmq6VWmWs+LU99/WfeE9sO1RsDRFarE5p9cSIfRnG
         uVsxkOr5BqATCguvqzPbTxT3DOQWqgSfLD7Um5dTtEyCxu7g7VPuy7BTlf+TdVdC5xP7
         nVIRDR9BcRpUFna3nmxBHc2qMhZvK7jrPrVO0AJCp81mN8FoT5OsAUoRB66KGlGbEOLI
         IIVPqJzrJyGbbIVhTxl7TkYy28OfWhPxJRakB0QBIaUuLX1jujwKtxwnbTOsXLbFlIFO
         IZ56XA1m/ZoV8ghCZGrRSyzjrVvQ8JZzh7mP+yCXpwbz+usuhQyYh8G8ZFZ0qlobXk6f
         +GHg==
X-Forwarded-Encrypted: i=1; AL+hErGnZaUwV0h0iJZbLUDsJtVFy+NMkMYFcUTfoJ4fm5J9FJVxjLlclXxN84Yv3invNrbYZobL5nGRRG62ikiP8iOT@lists.infradead.org
X-Gm-Message-State: APuU4Z/UHJAahn2cGFz/pVCm76H5KWOxbDDtWgu92CBrrLCRwYT38h4n
	nYeaq/z8LZs+a4gfYF+cWoR+423IJmMIIOlQ9xZQZhdTNAY92zRFxW5vjJNBNAP5jE0=
X-Gm-Gg: AZFdTZd1jAeuC9zhS2tl8T7BY8ph8lsOuSFCgVhtIZscDG3j2eJveMBXzqBPVhTtNWg
	dTwEVyiRFhEDDiWGhEwk6r/v4RTWr9iNFmqzIZ03wDll9sEVki9lXemevWp0SC+U3VKTXkQyHG5
	UjrtaZZnkkUhMyW/pu05geBt+Echc5vqbEeUrz5PLOgwZJX3sAvnlc2ZqokpjnRBTMtgcOOyy8y
	2TLX5pRtHpi1moPTo8mfIH+k9TNzaBeG7qp1snsZNGMGEUy9SBNntjWhwxhcTDcCB1zIeio3TYV
	rfCZ2stIWgEHbzq6aQQHk13pYJ5f0Pz8s3BhHZwaQOXPktDUP4ezfapd0Ijxaqf469YvZ7N+WC2
	/bz+5ylSugnD5vzC6LbwbNngigRjm/4g1Qb3Fd8JEdezTibM96uVoGLtOn5YjpR6Yr2B3DA5wxE
	PmSVp+xSHZiUCMD1r6vtHAYhYWhmmgwt4fOkQKKjkDXlAmhw32ae2MMQD+br84tE7DFN124IPaq
	pICfbGAws2dTfiptdom9NwcY+pXCmKn9t3g+SWTmYcRteWKnMYDNXoGAN+Dzow8oeOBa4d63XfT
	4i0DEYokrz/FyFXPj8/GeAdQOa0rF25KGkwDLo7Zl551TYgVJkae6L1yxEKEQa1v0jkP5yBwjUp
	uVA==
X-Received: by 2002:a05:6000:29d6:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-4abb58ec00dmr16232655f8f.48.1795515980993;
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm27197538f8f.50.2026.11.24.02.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Message-ID: <13dfc467-1f95-4f86-9d01-8a5830007d51@baylibre.com>
Date: Tue, 24 Nov 2026 10:26:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_022622_877940_5DB359FD 
X-CRM114-Status: GOOD (  10.66  )
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

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the RK3576 NPU. Its PC_TASK_CON has a 16-bit task number, with
> pp_en, count_clear and last_layer_clear at BIT16, BIT17 and BIT18, as
> Chaoyi Chen confirmed:
> 
>   https://lore.kernel.org/all/4f300b78-d96d-4d98-8819-dc292b0c9b97@rock-chips.com/
> 
> Add it to rocket_registers.h as TASK_CON_RK3576, generated from Mesa's
> registers.xml, and use it on the RK3576. Count the cores in rocket_drv.c
> against the match table, not only the RK3588 compatible.

In the corresponding mesa change:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43804/diffs

You had to tweak the header generator to allow two register definitions
to exist at the same offset.

From what I can see, Mesa has another way of allowing hw-specific
variants of a given register: variants/varset used in freedreno register
definitions. Have you explored using that?


