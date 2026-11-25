Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ns1+FBQ5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a62R23zO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Bw9/c+Bk7vL62EcgIQjabjEpAnCfrsNrEQeJWFIon0=; b=Ns1+FBQ510hdOZ
	P7KeQHaU9N1B3IRkkuAHkU2/IKhmfvrEpjPUxAuQF4Kan45AH8npRzdOUc4b5JuFfAJ9nXXgAI4c0
	sj1O9vzOSS+v7TOlDGTdngO1BSOMS3wA/evnM/xWMqFkX51YN1dhhmW8BGvEnT5n5OFoDGlvCqUAE
	W7iYMRKSlIAdWMS/HKLK4lfW4LtQt16eZET7R/0AObgtXSjjU0iRqdHTyBEx9jowNCJVCziGZdAEr
	1OJCL3fXYr2YlAt+DsRZtvt20XwEKmMgD+69Fl3VtdNSlWxhzovd8V1AL8+XEM8nc2pKqBYG7i/3z
	uEIB2Ov9d4YEghOIwFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8kR-00000009BLf-2NfI;
	Wed, 25 Nov 2026 08:53:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8kP-00000009BKw-1VsV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:53:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D01661D29;
	Wed, 25 Nov 2026 08:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF851F000C4;
	Wed, 25 Nov 2026 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596779;
	bh=0Bw9/c+Bk7vL62EcgIQjabjEpAnCfrsNrEQeJWFIon0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=a62R23zOLOSn/2uo6U9H+n5lMvmVGgAXiuWrZq+3cMsQ8Bo/zu+JNfg04UnE5oXdN
	 tQct+f9L5oQdEs/yFmjCUM3WmFhjnBFoMVbQMLJG9xqH89Zjde0IBR4gCc8t83ehY3
	 9JY+xlfjC+QzNReJpkhd8OV9HsYstVzVkqaGPZ5nYh7VSVKzPwcpI8l/+59xrk6PT2
	 Ya8e78hMsiijSw2R/n4sQitI1VD5cUJEurjVsB69tuZNNYS7PSIYWscDhuOiu34crZ
	 IjYxRg+7l/dNclfKImotJOgsv5ceYJEMxopmeIFbJKQYxS+piZca4vxSWMjTYbRPb6
	 tj+2WZVUKOXqQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/24] media: mali-c720: Add hardware identification
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:52:56 +0100
Message-Id: <179559677600.14607.6594089332845207687.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>  struct mali_c720_top_regs;
>  struct mali_c720_ctx_mgr_regs;
>  struct mali_c720_modules_regs;
> @@ -56,7 +58,8 @@ struct mali_c720_registers {
>  };
>  
>  const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
> -int mali_c720_get_registers(struct mali_c720_registers *regs);
> +int mali_c720_get_registers(enum mali_c720_version_id version,
> +			    struct mali_c720_registers *regs);

You just added this code. Add complete pieces of code, not half-baked
which you immediately need to fix/change.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

