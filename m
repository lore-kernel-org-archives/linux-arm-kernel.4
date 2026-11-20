Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D864606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i8HdoNXe;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=bfBvu1k0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WBq1coYA+tKY6l3zjpWcUqa8zsToSF905MLNKiI0tu4=; b=i8HdoNXe/ZYO8dkYmwpae3dTgp
	N24BjEea842UKOYTaB9kDBj95nT9Pl6wbh6Jt/7BFRTxD4kP36L9p58cN1doyWYoYxQcsnNPEklJX
	uAGXMFSePLOiT2VLInYn0f8OgBHtAOjNP510PErRUPSEJ5IxvFdYaMzz7z7s9p27c+9RRxqbHWwl+
	IqUeX0nQImnoeZLtnNQ5jgrd4U4eJehKCXCEy9hoIdqNgG1BYYZ7HUdrZiAyQk2W6VNvrVXaXtEOZ
	EVE7fEy2vn7yCBZxLFPRyFOM802uwlTjGtNWTAXtuQEyp+lUmQRFuoKTjw48nQGnzwyBAbtrAi1kA
	hf8T7jsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULLB-0000000EXH1-1ek6;
	Fri, 20 Nov 2026 09:55:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULL4-0000000EXFT-0taD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=WBq1coYA+tKY6l3zjpWcUqa8zsToSF905MLNKiI0tu4=; 
	b=bfBvu1k0/EcVedOGEOLD5tB/aKzbSbP5h+6fHhj0F+VmHZJrE8GSoS8aWuTdX5wkxqQfLD8znGo
	x5/AGcio30EQa1hGjQqtLw7KW9IxVhGtCPUke5hpzmvGTox5z6L3bJ0OOYd8rSwowPfrPg7ge8Qu3
	sbwTQtIvhqKHbc/ef2f5ysWxtOAxPnk8qLlKxXbtWdh3gapDOui1ARZxyuvgdriUJf37iTwCVLB2D
	6YroPHtNSbaSVCkjssly1PwTbSYzXGEPecpqbrPnVItMrVFZZCOUvgDOYKC5xRZpFX0UvPpxqO/yZ
	YH9LX9xaKRoZzz5WevuimYby7tf1y1Ot/IAA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xULKs-0000000HYka-25SW;
	Fri, 20 Nov 2026 17:55:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Nov 2026 17:55:14 +0800
Date: Fri, 20 Nov 2026 17:55:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Birk Skyum <birk.skyum@pm.me>, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Message-ID: <awAZAoNml0wYEiYM@gondor.apana.org.au>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_015526_255773_7A242028 
X-CRM114-Status: GOOD (  29.74  )
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

On Thu, Nov 12, 2026 at 02:20:07PM +0100, Bartosz Golaszewski wrote:
> This is the follow-up to the three smaller series fixing crypto
> self-tests in the QCE driver. It makes the crypto algorithms opt-in via
> a module parameter and removes the BROKEN label so that the driver is
> built by default.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v12:
> - Add module description in patch 1/2
> - Drop dependencies from the series as they're all in linux-next now
> - Link to v11: https://patch.msgid.link/20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com
> 
> Changes in v11:
> - Split out the patches making algorithms optional and removing the
>   BROKEN Kconfig label into their own series
> - Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com
> 
> Changes in v10:
> - don't pass a NULL buffer to sg_init_one()
> - fix byte order of the imported hash state on empty finalization
> - don't recompute the CTR counter in software for every request
> - reject skcipher requests with a too short scatterlist
> - check fragmentation for empty CCM decryption requests too
> - don't use a static loop iterator (duh...)
> - initialize the return value in qce_handle_queue()
> - Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com
> 
> Changes in v9:
> - Rebase on top of cryptodev/master
> - Rephrase Kconfig help text changes
> - Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com
> 
> Changes in v8:
> - Add a patch making the crypto driver *not* register algos by default
>   but only if the user explicitly requests it with the provided module
>   parameter
> - Use the "offloader" name for the crypto IP instead of "accelerator"
> - Fix device module table issues
> - Make the core driver use a list (despite it only having a single
>   member now) of child auxiliary devices to register to make it clear we
>   have the intention of extending this once we start the work on secure
>   media playback
> - Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com
> 
> Changes in v7:
> - Add follow-up changes converting the QCE crypto driver to auxiliary
>   bus, adding the core QCE driver under drivers/soc/ registering the
>   auxiliary device and removing the BROKEN Kconfig label
> - Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com
> 
> Changes in v6:
> - Handle all zero-length HMAC finalizations (like imported state with
>   data already hashed), not only the genuinely empty message case
> - Add an additional patch addressing the fragmented skcipher payload
>   issue
> - Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com
> 
> Changes in v5:
> - Dropped patch 1/8 that's already queued
> - Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
> - Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com
> 
> Changes in v4:
> - Remove remaining ECB and DES3 bits
> - Pick up tags
> - Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com
> 
> Changes in v3:
> - Remove even more algorithms and dead code in patch 1/8
> - Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com
> 
> Changes in v2:
> - Add fixes for the full suite of crypto self-tests
> - Add Fixes and Cc tags
> - Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/
> 
> ---
> Bartosz Golaszewski (2):
>       crypto: qce - Only register algos if the user really wants it
>       Revert "crypto: qce - Mark QCE as BROKEN"
> 
>  arch/arm/configs/multi_v7_defconfig |  1 +
>  arch/arm64/configs/defconfig        |  1 +
>  drivers/crypto/Kconfig              | 22 +++++++++++++---------
>  drivers/crypto/qce/core.c           | 13 ++++++++++---
>  4 files changed, 25 insertions(+), 12 deletions(-)
> ---
> base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
> change-id: 20261022-qce-fixes-broken-label-e6aaf9624fe9
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

