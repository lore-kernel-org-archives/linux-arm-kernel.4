Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ze7tOcxK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smTGdzUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=; b=Ze7tOcxKHXYcbqOs86AkyN62ln
	s5dehetYxDCXUSOFKV1f1GhE0Z8xM9Pt2tMvTYje56jE5RuMy04XW0aZWw4YuLtZmIJIMw/3dGDSH
	Yy9laSoJBIqjUR2po80flV4AgNdHcoQM5hMGCx/YD1vtpnH5k7D6Pro995KaPrz68TweQq2moU3Q9
	D10gmsDEYtqUK/luyM/v32lyARj8DtSBFb1qxScsrasMt5o/94TRkb7RP5iJdJH/t5cNHdtHYjfro
	1SxzMiBrSRt0vW9gCho1PT39OPYkGHYR19KknuTnNmihS5BQr3gvRdChGl+0AeTaAM2y7WkZssUym
	k18Dxubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXBcc-00000000PRv-0xJ1;
	Sat, 28 Nov 2026 06:09:18 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXBcY-00000000PRX-28Hj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 06:09:16 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-38431138772so11550740eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 22:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795846153; x=1796450953; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=;
        b=smTGdzUDXpjgDn5JSVfsyBnkd92uNBqsbxZuK0u73kAuJ4/t3U+vMWapQWUehl/KWn
         qK7AkDUAtKymuVk0HM5k44XVUy4j8SPBndv3G//dpJaSB3sJuVGRc4Vig+zwvmyorH5O
         TISSwOSJJKJrM8Veb6c485XCumbl90PxE7SXePBIGBkXYBpTgptZjfUm5zvSNHJ0Lupd
         3pL4q2USaLfdNDOHGY3gErPBpKEbjuHUoo/49KQxjfR2w5llgIMU/vp+IB9K7axQ1vnL
         M+tlzC27T/HR0PolAgj/JHHrdaYOp7KmvonbkbZRxXaEFY6SV8Hjmk3+2w3V8asazXCY
         B4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846153; x=1796450953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQ2O6ohYt8StqDgtNbo2hP/n3Jenud58IIFUvX2imSg=;
        b=ysc4TqnrESXYfY2EFy6vZMKPQxpGSwdhx8wlwqFoLhqi7uhpMIgxNtyAsRwlrwhjpD
         9BOUBWn92ve+RBA2bY50agBD9/UhE0WfBY/zGlrSpWWwGglEY5zCh4B5+VGPymUJloUA
         ri/OJCgV/DDIyvXH7EYoZt7rRcoPLr1+WS7cD038uD3CtAJ0DfDxUHATdM2kYI6V/r7F
         k1oQXWr2ZublX3M+iYDVdYIc4AjLFzRuQRIqGXv97FecpJFFf0qAVV3OSF+s8yW8ddoA
         jVkVLeu3lu30OwZZk5Ps1wdjqchpA2lt4cR6VR8WMEAH6XxMYasOSGA5EMLxIkU6+Kv4
         Vf4Q==
X-Forwarded-Encrypted: i=1; AL+hErEY8uX0Ee4ANLjCd4UFMelvjPE1cmJHigsjv7quLKhss29dKcJPw+0DEQX4xg7FiDC+O/6ia6CMnF9Le6ZVJWCk@lists.infradead.org
X-Gm-Message-State: APuU4Z/4Adwq3CAESJM6zCP6fVehzzkhtkKJvfIVRfi47F/yKJEr3uL0
	U7e/kYsn3bcZGbfLG4SIPQ65ma+A+WCrAiAlCUF+sZkG9XuFXCZCN9q0
X-Gm-Gg: AZFdTZfbFiAVpGDuEAaQsBOHHGWPU3toZjUO/Hbw2c87VDLFubSSgPhQFk09iXZYito
	HVN3m2xq0stw9BIIE6+YXhe2BG/fzi+fB5x8W5Qbj+bRK0qh+o9iOEGWPy6IAeDfh90Y8F+te4Y
	KCcBACObsdv0Nv6dA7cDv84ZIdGVcaMl5v8Usw2bWq6XUIWyu452XJV75JoXB2z/ofkT6pviGh+
	zLbip/Y1uaJq/0Q0F3KbghIaU3axqpkb28hW2HEqp6iQ/cv8ugnoou5rP410kR1l2nvolkcSDt9
	QhP13QF9v/NolFKkRhZdmCUWz06las0ZDTe+m5V1d2eMNwJZeRGa4X/0hivVFlnsoXd8phpbJnT
	kG3VnyhizILSihR1LAFIKp6BkhX6z6P9bZw+a/dwdD0a/CaXUNCl5y0iIoC7NXkB3NcRXwUXEOd
	xCxBTrFmJOAj3THf8AmD7x+0rHE9fxwoojx00Nv1KoDleM1ygNB0IFsXXHm3BWqcdyqcmRI/eXf
	KEkjdIlzyBG/3/3/+9EIfnjbhsllblKaL9co2GNc6F+FF1CtDQ6teYmX9vuUf3JqITVYnRldL4F
	70lCjLsQkVlOPdn7N5zmDxaPs83x4oxMEqg6bZl0Rod+ecN8/h11TnjuWDgfAWVupg4G2rft1vM
	v462sv7Wamnl+vf4=
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr15639221eec.35.1795846152934;
        Fri, 27 Nov 2026 22:09:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:aaa:5a07:6335:86c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm83886487eec.14.2026.11.27.22.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:09:12 -0800 (PST)
Date: Fri, 27 Nov 2026 22:09:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, David Heidelberg <david@ixit.cz>, Andi Shyti <andi@etezian.org>, 
	Rob Herring <robh@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/10] Input: stmfts - fix
 i2c_smbus_read_i2c_block_data() check in status sysfs
Message-ID: <awpwAc8i8VE29tt7@google.com>
References: <20261127201050.3532488-1-lee@kernel.org>
 <20261127201050.3532488-6-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127201050.3532488-6-lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_220914_615222_9D3B2567 
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 08:09:59PM +0000, Lee Jones wrote:
> i2c_smbus_read_i2c_block_data() returns the positive byte count on
> success or a negative error code on failure.  stmfts_sysfs_read_status()
> checks if (err) and returns err directly, so a normal 4-byte read
> returns 4 without formatting buf (exposing unpopulated sysfs buffer
> bytes), while a 0-byte read formats uninitialised stack memory.
> 
> Return negative errors immediately and require sizeof(status) bytes to
> be read, matching stmfts_read_system_info().
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Closes: https://sashiko.dev/#/bug/linux-bd87edf0-6f79-4318-8780-d69205787e7d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry

