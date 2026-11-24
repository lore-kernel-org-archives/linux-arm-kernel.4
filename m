Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D4606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qn04HprF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZAnhFj9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=; b=qn04HprFTl5jx6Sp9znrXs8NLv
	qwiB0xEhbgKa2QjWHqY8p5s1uRc6QF1dx5TGNB7T7g3GawmTHAUdJH4D9pt0K2c7JpZlGkE/xQaIh
	pOVMQi2xyc1wFYQq0d9Tq2PSbNGtPO6ssemaHEChtbcLQF/g2hIX3o1TNYnWjr/cZup31djVCiOpU
	5WQ43gWTOINYkW859v949UlS+SHFd5/uCPU9d6n2VTE7en3yxEe0juxCZXslPO7zWxSGWIOkrfB3Y
	gb51VOOVvuB6d61/2DuFWkL7us9hqhXAawbJOHMhEHzZfK3TpwYqDPjpkSLUQLfDltFgw7PKr618O
	DyF//BHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjz6-00000005eUk-19BS;
	Tue, 24 Nov 2026 06:26:33 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjz2-00000005eU3-19pO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 06:26:29 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36a315ed211so5196778eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501587; x=1796106387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=bZAnhFj9D2naQZFjNvuE6o0Mimt4M4gbKcArGMcn/l7ssqJcSt0ELPdy/PIZIz9Dmv
         qNax6T07Q3W6Kb8BIa9tmcrOAB92R46SD8JBDSCl79XpOsaXzUHYwq2MJpx5Z2wk9QqJ
         IEw5RJuokDWQwFsGlBSKnEhiztnwm4dPwTee7n6hEsw4x4gg3Q241zkxj7WGcaIDlG8/
         eSTDUrPvyEaypnKR9LkU0j8IK2gwRa+Z6fbpKnhJ+QEtUdurmGHTgVnvVxwVZWtFeQ4g
         Q4mnbLCHMetWtVacgr6fZbKU9aG5e6ig0cnovZB61t72qybTrwgr8YIvFupKdyBwcLQW
         Sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501587; x=1796106387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=pbANvCfF4pJd25sLcFz9Pm6rhKNyib/8/m0ZluSY5NaK4GXsfRkw8Q5tkwAHmsz0Z4
         gqr9VotKmnK0CDJD9rfMO5odiBZjfRfYKFzev9xg29YfQI99on/JMQn5QJTtQjfJE3gH
         Fp+nDcds1Ha8pWpraXQ+17pkNvGKx01la/ZYIDMHMTR5AmXR1tTAL1GEk4GMlvzkIHyJ
         aLdC02zVxIDKE7CMfVv4E5zKIPofPWm28nHhb4D7/zkj2ZEsZcbd9epcVsEFEUpaXite
         DIWo5QoqJ0Dk746wn/37xctlFIVqmea2gvQIy6Zj/NCTjSwz1Uw69LLw51alp8ar39IN
         ZcfA==
X-Forwarded-Encrypted: i=1; AL+hErHi189ZLyctRpboH4uLmijH7XkKIfDdt8r34pNZcnafTKVbgoaBbrmW3ktuNCHquoG6RVG4uwlcRWAvBWTUXlSF@lists.infradead.org
X-Gm-Message-State: APuU4Z9QfyhfTg16wofE4Q7ZMCTgHnWubGKsF5FyECEwIvrMPY9Etf2s
	BZioXwZwja1ITagNP4THXeezUbPUMsbyD7nmwF+Bzjfwame12+G3wpu9
X-Gm-Gg: AZFdTZehXRjuXjlWVNfQrbGNOMNZaJT2PY3utpFhunA+TvSZ6TOc7iIz4k7Gs7e7wBa
	8zfLhfQy2MAHWrPQAZAXS//7L+o+TTMirBatu0z/3PZHyouMFZVz8XS+3b9ASJ7Uc6hOC+f8MkR
	RAf2J/+qQ4SfO1DsZpfn936vaBjFtx+398awhSc/bl6TUQK78pNjwIloCGfYtbeAllrBi4CByYE
	95obNzStI1UlDsD4HecVaJy/Dk1CnQbl06GGV847XXB7MKzvoSjuhCV9wU5kOMK+wipDetaj8EY
	y9xXm/6Xqi1RvWx4gbhtnRoFJy0tUa2+svDQg3bsIhpDoaRdm9p2NV8Wb1YgdRl5KrVtdQFmRCg
	OJL8matdnqmE4r4z+ShTc6oUzqU/y6+71VIOPHkNyxz5Kx8XQT7vGz83HsR8HGALAKY3GghFvUz
	StYRaHg29tZAnoU3xRJZxIg9gojVjjpoX/Miyyr2+lWKPiOC1MAvnzc2rAMsfmc8glzLT4nL0uQ
	u7S/mApji8FJznwCibkW8E8luEdUSIxSWy+4BMDLJw4o3kG6MbTXs0btEoRYDHmvTlA+d3bIkAT
	LyPYQb9O4lTewaxZfSqgKjIfKnDmRIv3YYX5UFyVFNPQmuC9OVns4Nu+2nytBJbtaeZfygeZ
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr6427409eec.27.1795501586545;
        Mon, 23 Nov 2026 22:26:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72739389eec.3.2026.11.23.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:26:25 -0800 (PST)
Date: Mon, 23 Nov 2026 22:26:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <awUuAzGu3ZoADKyB@google.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_222628_310374_A5A0B41C 
X-CRM114-Status: GOOD (  11.76  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 02:18:37PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Applied, thank you.

-- 
Dmitry

