Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312D606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbbhztHi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epgrbF2n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=; b=AbbhztHiZ4+Dda0f3gIBZxNsLH
	a75SAFae9Fd06IswhFxi0KD/hnSwb0w9+lu2Bf6L2pyBjb8MIaVsLbiNMbftWnUUqzBzCx5nNmqvx
	zxFyIBAtfR/zs/9Yl9AGVj0Lb+Hh5b9AeCeDVLRo9xUmByp82Szw+4Kv6fb54yFNrQvkqfDu2Q/Qh
	A22k7smhAz+D7KC0Eo9toBfx0sR2Xs2Ap0QHdSmicAPZhnEtUbfLb8mLAPnOPQwPRfS8NdzottZNp
	EC7jmi2oI1CgWLKY27p7kI6zqZLJy5CEf1hBZJjhP88y5Dp1XyrORCfT95fFIuxep+20T58RsfxFI
	GPxFt8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0zS-00000003TS9-1ZWz;
	Mon, 16 Nov 2026 17:59:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0zP-00000003TRk-2fG3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:59:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1237365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851973; x=1795456773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=epgrbF2nLAkljX0BApg8PHMbi69RDj2+WPS9vpLcldcntC/UEDsmAJkx8sVAHgOVPp
         m1CDVf0nJ6UWwSYG5b1q5lLCJX+udr+i9+HhqqpLZZafk04AN336Z8gkVmkmUs3bvP4z
         20FpDJdJt4U9uypyM66exCzg7GkUW9Tydi0BITBEFNBOhcszlJ57/Zf05+qzZb5iGq0W
         6AUem4tANHqft/V6W1A2vbf12GXY5wgUlXS8Ln6anUalBERGnFdVQd/XBdkXcDeJDRFZ
         CgWwf9qZt6UCTHVTaF75peikgxpolIWiH1rBA/3fkiIe/hrVlWTbP30M6tGNjF5TpUmi
         7xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851973; x=1795456773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=f9FWoIxneTTDER7EyLc5gBd7sdaTnYfrHEnfj7TqddwxKUXoOBQG+Cpx2h5Kf7hW1B
         Qii76ztb9bJ6Rkb1HLE0SkLjqOaLmlGN/BqFSn29zIWAgcMsRDKQINa5EHHLv4jHnBAN
         FBlpEcLnvhavmZyvFESFGOIujjezB2qfu7xCvXPVmDkmif128CVreUbtEZjaHMJrNgjf
         O2plrIiyT7by6EcgHVrsrwJI3NNEiz3v6M6TiiRAcMgS9RB26wdxHBM5WE+Ejer7VjLb
         nPZqSzmj1bO/hy5NPSqLbSC/OAsoj2yl+7QVLIbgak9v6SjBlyGPEJt0lEIXKAPOoX33
         VkNg==
X-Forwarded-Encrypted: i=1; AL+hErEcJB29KbezTZbLvBoqyKjlva+Aq3I8lbQvGeelrEQrgrU5EbXUOFXyPZqeqzjUSSZNC5o5qh19a+bg87KHxyAm@lists.infradead.org
X-Gm-Message-State: APuU4Z8xXZK+AjS1dynxzYuPRVTVBQm7otYOykEGX94yJX+DlGqbqrTY
	ZtAm47N7yl20fjRv8Mq6QV+fPFNOrw3n7Xu8Y7HJVSUp91eKjHLieGsm
X-Gm-Gg: AYBFou1TbmFEEIDXrCVXycWCz40rGVR29AWSx9yFGvg5tY6T+pMNneXv+fG2VIF8gTQ
	DbFFPnXf1KZFbt36RVz+ZwAY9XXoCH5lOArvgJiQASV5bpygEwYOx2NU8neV1O/H6ZdfqysEoT1
	T+AI3HET1ZTFLjo1EdT+VYohm+fN1wSDNkFrMAYWg8KDjLvaur1XuyqAaidiqzHSmqgkdmX4jfp
	ppW3dqZ9uPT3tQNklsMiWYPwqjJ6AeCVMeNK10vYgHDR5DKCOsynYHvGQ577u6Vlk2VeO6EzNJC
	Q0C11ou+8dtYlN7Eve10OAFzU9xkwUSspQzzPvPw75iyfPeQBLLl9XsMlJxqim29wZgOiVW9K+r
	e6ilyqfFRxIYETKywUWGQZbBeA/rT7OYA9/gAdyK6jnUAzjHsD9RivT5Y3GiQl76jUGkRZnBxpc
	K9rh9PCdOig8+uedpF8Oolkx2N/9M/nS7mVcpbQsrGem4OBh435XD7sd0TjQDuP/61I+yDRQ8om
	0UJcKTwsCruT1sHbEA1GTgS+M7Komt+dvjMHOkwwuebFhgAYmLDMOMQpghFobZ9NuIf
X-Received: by 2002:a05:600c:678a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb78372a20mr8533235e9.2.1794851972940;
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm22431108f8f.21.2026.11.16.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Date: Mon, 16 Nov 2026 18:59:30 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: acknowledge the count byte of an atomic block
 read
Message-ID: <avtEgpw9YpIzCj5p@eichest-laptop>
References: <20261116122707.1349139-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116122707.1349139-1-mehmet.fide@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_095935_696427_48C2B896 
X-CRM114-Status: GOOD (  27.53  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:27:06PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
> with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
> I2CR_TXAK only for a message longer than one byte, so the atomic read
> does not acknowledge the count byte. The target stops sending, the rest
> of the block is read as 0xff and the transfer reports success.
> 
> The test for I2C_M_RECV_LEN was dropped when the read was split into
> i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
> fix emulated smbus block read") added it back to the interrupt driven
> read only. The DMA read never gets an I2C_M_RECV_LEN message.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Reported by the Sashiko review of "i2c: imx: test the block read flag of
>     the message that is read":
>     https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
>     
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
>     the M41T0 RTC at 0x68. The core takes the atomic path only after
>     SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
>     disabled, with the two messages that i2c_smbus_xfer_emulated() builds
>     for a block read. Register 0x04 (0x13) as count byte: without the patch
>     0x13 and then 0xff (50 of 50, return 2); with it the next registers,
>     the same bytes as the interrupt driven read (50 of 50). With a count
>     byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..1a3fc245d6ba 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
>  	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
>  	 * length is unknown
>  	 */
> -	if (msgs->len - 1)
> +	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  	if (use_dma)
>  		temp |= I2CR_DMAEN;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

