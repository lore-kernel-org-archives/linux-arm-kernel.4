Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQEbY8+l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5U60MJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+vU+7Y2PCRNUDXo+sq9092ljm50COrhrbCWF1bkUu8M=; b=IQEbY8+lU/spPC
	RA1eeCuFJ2kJkuF7zNDjiCZkhlYCI4FaNQHIv1N+DeL99egOA+Dd3ESODJ+fyDuP6FA2XhEguT0/C
	ETeyyC74hvTO4Q38PdkewuyvgoH5+SsYcJ1ysC3bpbADynDGp/NvYPLYDRN+ojxCRCvTyilJ2jvsg
	P3NczyT3D13h8nD2ZF5fcPHzAhFo+wu3peK7ObjcxhEOCz3buct46Jq9/jZN7+VN6uc/w2ltzcDBc
	sWLykwPYBDIhDu13/VdZI/T/zitYkv1tZrZMuZSoSkknuYCn3POWNxa+xCJOMC4Pz6yGz/Fsa/jkE
	hg9ZO3pg1jg98OIreU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8xc-00000004Pfn-3oF1;
	Tue, 17 Nov 2026 02:30:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8xa-00000004PeJ-3xoC;
	Tue, 17 Nov 2026 02:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC45A6138B;
	Tue, 17 Nov 2026 02:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DCB1F000C8;
	Tue, 17 Nov 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794882613;
	bh=+vU+7Y2PCRNUDXo+sq9092ljm50COrhrbCWF1bkUu8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K5U60MJsVwNbCJzL0WUx0AlEL9z26JnyzM0wvja/NBLbfJAxRDGXg3IKk2BykT4TF
	 xquHMR4HCX1awQlNOJNeNuTPkVgUOZCz+vjIvaflhCFJxX9F+7Mu3dGmtrks+9e2vd
	 e4w6vV9D8w6ClSZ8uLuWeWKozVypqTeUc/Utly9BcrElvZXUml22Gl+O8m9T2Y7PaE
	 NlVs9YSLXcPORoumN0XZKXgGITyfuSZb/uCwEU+sWg0F9K/Oepajz92v/9lvNdvyEb
	 5z9JH5oBj6w+wVqwbiUwBVoqdpCm2q0pYYwKUGS8Q7KFZIUikTZbQ9p82vGKwCQ6e0
	 9KOp79/Z8lJuQ==
Date: Mon, 16 Nov 2026 18:30:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiko
 Stuebner <heiko@sntech.de>, Aleksandr Loktionov
 <aleksandr.loktionov@intel.com>, Fabio Baltieri <fabio.baltieri@gmail.com>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] net: phy: move
 DECLARE_PHY_INTERFACE_MASK_ZERO to core
Message-ID: <20261116183012.11a7ba72@kernel.org>
In-Reply-To: <20261110160554.918652-2-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
	<20261110160554.918652-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 00:05:53 +0800 Coia Prant wrote:
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -159,6 +159,9 @@ typedef enum {
>  #define DECLARE_PHY_INTERFACE_MASK(name) \
>  	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
>  
> +#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
> +	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }

I wonder who suggested this, hiding the init inside the macro seems 
a bit subjective. I see no such defines today. We'll need an Andrew 
ack for sure.

Please try to add lore links to previous versions of the patchset
in the cover letter.

