Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61417606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4sfm2KB+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BIrEdQEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cPOYteE3bRDXKxo0ErQBK87qKbUPRqdG39Q9wScBhTw=; b=4sfm2KB+p2u8mn
	AaCaPjhUOmoDYexTatqXP0gIFPyoiAYPVLdxVO+nGg6KKzbGMHbUV84TADGLWtlsokixpZ0eHI4Mp
	Aw0+JzBBYY/Qdw9MeGkqgWQr7YzqudI1wZqxWxQLopmessui2v6mLKZfyYsMvz1dxdFzcC517fdh/
	AdIyjGL0M79mBn15Hnr+ASJvla0u/RSmSdzyfWeU8z8fehyzhsgL8QwcBcrv5AD0+ZY2290HbrPlv
	17Da7DZXpUPzpAq8l2CEUvkXdUiwWCg6kyJkJkyejQrxT7WY/nAC+ADEsXSFYIn6YaQPHIwBUDw+x
	AJ1w5Zu8oh6Oxs2gqrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW5Y-0000000CbsC-3TK1;
	Thu, 26 Nov 2026 09:48:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW5V-0000000Cbqk-2d1K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:48:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1831E1BA8;
	Thu, 26 Nov 2026 01:48:17 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B33C3F632;
	Thu, 26 Nov 2026 01:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795686499; bh=rVrsHSibW/UwgoRb5V/hciA4t6LaTTJ6geWEmfAAvPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BIrEdQEBa9Kc99fKd9c5znglbh8T7oJ4R4KuKX3cR9RvSyxyPAXHiO61FSCuViEob
	 NSQMIrxFXJLbjmhr/6PjU5ycMixvq+R+MZuAfzGL7exKE+vOAVy0jGILHtIMu0FG8V
	 kzJkiADjaA+nAFiSBgBwioSHrUXzhXeYi7zwqw6s=
Message-ID: <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Date: Thu, 26 Nov 2026 09:48:16 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Brad Hawthorne <brad@sim.vu>, Yoshifumi SHU <envzhu@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
 <20261122003911.1203777-1-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261122003911.1203777-1-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014822_181316_9C4DE39C 
X-CRM114-Status: GOOD (  10.16  )
X-Spam-Score: -4.4 (----)
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

On 11/22/26 00:37, Brad Hawthorne wrote:
>  - irq-nvic: the priority registers are written at the wrong offset.
>    Yoshifumi already found this, so I'll leave it to his series and
>    test it on the RP2350, where the board does not take interrupts
>    without it. For his changelog: the offset was right (0x300 from the
>    node's base, ISER0 at 0xe000e100) until c5e0cbe2858d ("irqchip:
>    nvic: Fix offset for Interrupt Priority Offsets") made it 0x400,
>    taking 0xe000e400 as an offset from 0xe000e000; that commit went to
>    stable as far back as 4.19, so the fix wants Fixes: c5e0cbe2858d
>    and Cc stable.

Can you or Yoshifumi send a revert for c5e0cbe2858d,  please? I admit
I overlooked that base already at offset 0x100 so I'd be more than happy
with revert.

Thanks
Vladimir

