Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED366606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m1MCvYnN;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DLRDwsC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=; b=m1MCvYnNROv1BABmZtxx2sCD6T
	ANUKyqWKDX5WBNV2kJKz/fuPIh48C1+pA2Wei1O0jPruZBBvKot78QTYdd/unahn7+T+8gwtXzRMG
	60NgT2LsI9urtdPk7+7r8ZFNL76XuY0G3KBtoe7Jb1XoMe8w/A44x5kdsOYH7RRpmWNmbAU6P/jSA
	WOJaI71YUio7bsc3fvH4rV+SeeO97gf8e+ElEDRfI+gBViY9YhEBx1zZ6fE+jztrfXpA/56SgaY4d
	UjexNl988ro9FUgsWZarUZ4OitP6QtBR/ofdab3PgWEUxQJoL8w4tSccVI8HsMHWUi6Oa65IkerSq
	fYF+WLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaMN-0000000DWwG-1HEC;
	Thu, 26 Nov 2026 14:22:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaMK-0000000DWvD-1WMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:22:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b467581b98so68817655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795702918; x=1796307718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=DLRDwsC3H0In2ZbI7ipviwT6fDmDeOiSf0KAqoxrZimQhZoARFs6rov0TctNLdZKsW
         wKr9A8oUY0Kth+rgf68HwEAaFA1YTMEX5xCewq5ZKvMpPbYig83ytgwCyInBxbBEnXsn
         /go8too8h8uWEM8ApbkaoVLdJQQYx7aTF84sA0t5SKsdTIJ+NuGKn+omxfgKrKb+WhPs
         uYQzS9yDuyAY1b6k3Xvci7t+QYazDm4XHQdHPQBYp/6+pMrh6oKWQ5N7dT+ApLQIvs+3
         /Xzg66cluvGaq0uAcHI7STwwqHHaVuor3lAbTE6u7YXEjfTdtafhJjMmhdWV5+3K1VPC
         01Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702918; x=1796307718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=HelHrD3C6Yx3ImTgzSLX/Vpqq/Ti1+YYnNrVjwxgcaRzlxoTfN3UF1OvtIJ4Bfcd4K
         ErEE+9w3Log6sfnM5MYy2WrZiCvruajKN5KBPWvMFJAqchcH1J3ARniijTMYfwIYP1jO
         isJNoJE9gLuo9jkeRDWsVid5cdlClXd/MbKSxL3c4a8sk8bxeqZsI2y45p+DVBxlJmMh
         iosmcRbw+ewbwXO92hBmL49VaYzw+O379atlwB4wfa542bT8wpxtARfO+eXf8F1bi0V7
         SRZ1ImE/ZTGk+8Pb/sb8s7WreFtdp2vFV3S4AoF+OjcbA+/gg7IhJq/avLrdlj461zm4
         Hvmg==
X-Forwarded-Encrypted: i=1; AL+hErEmCHVedMtqN89SpqbKA0AkqQnIxbvF7aqkUEX25rXSyWS8UVvd3iqbzyjax3XIi2/JBz1pKORAND05FCeMtcAW@lists.infradead.org
X-Gm-Message-State: APuU4Z/XX45tVyUfqlmRSIRgUcmySfB/jzaZ1bPzX2tpGnmg5hJzw6n4
	4G4MdzqOZKodpymhp8U4ucepO2Jak71YIL098gz5u5/opSDYBwvpIYlgOrQHcTC6U6s=
X-Gm-Gg: AZFdTZeI/ZmglJVecTL8FF40febCGALRmyOIUJrtcAXxUqx+BppQDKRbxlhkuiIOzrN
	IPkLoB8J9UyrB510vJ5BjoNNH9RhzsY1Ts4rzH+G0kRWnsH8pt7XqmSh4mOXI73Z4maKDdXNsiF
	IPx4st6neE3FH7zptZNrN4nQULqpT/NT6RskDq9ZZ/Tg/VhcinhbIyG4aNxawQIyHY+BHB2EsFG
	MZCrfPoaUig6obv4SDeMk28RE9FasxKpbrDDZc4EnD4Nh6qYRpLOUZrniQuim9wRndkwKL2dLu7
	5X050upPxk9Am4cAgh1H6XgFmu93YU5BAYred05smHF/baLApI/h2g3r/5rf2k4W8UAoYUn5ynW
	vTS+yDUFusneo4HZeiFyhUeQWbrHLPFTPuMwZM9JobNSIpCtzCfXiA9LV6iN09JHwio3foUrNyu
	xvWoW3wFJveEA9MHAkVTZY2V0F680KQjCpV85fD8K/AyTZnqqSDUiK4KSJ6jstiLjWFu2d0OvBD
	VEm7kVNYEskjROBdyV03Q7iKKDb3ia4DgM5lngh27jYaR+YPqKaguZDFUz/E3MW5rE7WNOhiKp1
	x6xybpaTCJN5KcdUngd4Q63f4jRj
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr401901655e9.14.1795702917688;
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm831228715e9.13.2026.11.26.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:25:56 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and
 a typo
Message-ID: <awhBdHDVnmxNhQOM@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
 <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_062200_410483_DF7F268F 
X-CRM114-Status: GOOD (  21.92  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On 14:12 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:39PM +0100, Andrea della Porta wrote:
> > Fix the coding style issues reported by checkpatch: use u32 instead of
> > uint32_t, add the missing parentheses around macro arguments, which
> > could lead to operator precedence issues, drop superfluous parentheses
> > and long int, and align the function arguments. Also fix a typo in a
> > comment ('missmatch').
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
> >  1 file changed, 42 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 06d830d36882..b19182c6e3df 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -51,13 +51,13 @@ struct bcm2835_dmadev {
> >  };
> >
> >  struct bcm2835_dma_cb {
> > -	uint32_t info;
> > -	uint32_t src;
> > -	uint32_t dst;
> > -	uint32_t length;
> > -	uint32_t stride;
> > -	uint32_t next;
> > -	uint32_t pad[2];
> > +	u32 info;
> > +	u32 src;
> > +	u32 dst;
> > +	u32 length;
> > +	u32 stride;
> > +	u32 next;
> > +	u32 pad[2];
> >  };
> >
> >  struct bcm2835_cb_entry {
> > @@ -116,8 +116,8 @@ struct bcm2835_desc {
> >  					       * AXI-write to ack
> >  					       */
> >  #define BCM2835_DMA_ERR		BIT(8)
> > -#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
> > -#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
> > +#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
> > +#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
> >  /* current value of TI.BCM2835_DMA_WAIT_RESP */
> >  #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
> >  #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
> > @@ -136,9 +136,9 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> > -#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
> > -#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
> > -#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
> > +#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> > +#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> 
> You touch these code, can you shift to use FIELD_PREP() macro ?

Done in v4: the register field macros now use FIELD_PREP.

Many thanks,
Andrea

> 
> Frank

