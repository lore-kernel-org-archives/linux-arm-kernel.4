Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YXQTO13O;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=dIhqHrpZ;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Kq53aB+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ohzi203yKMWUnbkmuyMG76MMrHD3zBvQvlxSie9xOmQ=; b=YXQTO13OwPEFaf9oTDKR0XsaoG
	svWGMtCnLa6Dvyhs45kuqkj928Xe19uurt8HZfAl0yiPE/tkLffRj2Z9ScqEzrZ7vDIcZZ/NkcsVc
	aDawb7rB+23zapJlcHyRL2IfwFww3Uu1kLlqS8z8QsGQbvQibYlhnBZRFc4oErIq/0BFH/2cCdUA2
	xIGT7CVvHWloFfdpQrHy2GrRFBlV5OEigTbAFD5yr4aT3vkwJOJg2Az0LoW7jrxE3kBS3lWeZZ2qQ
	OyuQV1HG+xlL/DsjDLqj9rKzU16VJzHeZVbbsAijAnf3tQpMNqFHh6pz/aVyYMc2/Xdsbq5j9UiLi
	tiLZs1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRlI-00000007Ek9-2VFS;
	Tue, 17 Nov 2026 22:34:48 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRlF-00000007Ejg-0hbc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:34:46 +0000
DKIM-Signature: a=rsa-sha256; b=dIhqHrpZ2o7lgKWDF475+Jzn84Ku+ta2e7VDE9zTgbQzUzPaDnoDl2MWOmiEkOHLJfxI5P+nUjfRaXVhY2IW6w62VDEof6zlL4fdO0gdlHIv2ADrUPdZUo6Db+UskSpL3ja0WfRwhNizReBbjZ7vbmDNdLbDFzzUXJosdFgR1KBPe4FRHwB1nGW5AL//r/1msQjhfM11gSvcXqRLH9UyUH3i8xOv409bPkUpPnr3fy8hb424STcgKkYnCtp4vWN/5w6vxRKUw7zTT3M6Ifx1S29453eKXnNdaCee+i9TnQc4tdjRuz7K9DFC7ZA00fms6W/yq4yK0FXWFw6/sgLHTQ==; s=purelymail1; d=sverdlin.org; v=1; bh=ohzi203yKMWUnbkmuyMG76MMrHD3zBvQvlxSie9xOmQ=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=Kq53aB+FMbAK0mUP0TDBhtTnsPTxD/kdYw+nuXc4Vl+PEgAkB9A+mig3SbRW5VX2tZgsDxE7SJ3tZ396Yqt6yP4p+s9/ptB/0hWUe5vpU+yCEo6RYpONZktFmwW3PNVgLhevpJeOTFAWNhdeMN7ZeW3pccQUsg/VJjUsJ4FLTDCKyQw34jGQrtCdHCmGxSIpVolzKIIkw6Wom+xz1ePRldN/9U0t6gAMehQoA2+Qxq11oXCdN1v01U6opo2Ghor5t0QQNtg8rIUwhqGGlJ3cnGmtyJz0m3drnmFwjSQGUBSbn2U9/aNU3PUioMgZ/gxQrruFkcocfL+43f9nmTHUlQ==; s=purelymail1; d=purelymail.com; v=1; bh=ohzi203yKMWUnbkmuyMG76MMrHD3zBvQvlxSie9xOmQ=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1938573665;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:34:32 +0000 (UTC)
Message-ID: <6350ad134c9d09d9754ad79d942a9205c8cdaf84.camel@sverdlin.org>
Subject: Re: [PATCH 2/6] cpufreq: sun50i: Move nvmem cell reading into a
 helper
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:34:20 +0100
In-Reply-To: <20261104-a133-series-v1-2-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-2-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_143445_320858_2F12BD95 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Rajan,

thank you for the series!

On Wed, 2026-11-04 at 22:40 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> The A133 speed grade needs several efuse cells, but the cell reading
> is open coded in sun50i_cpufreq_get_efuse() for a single cell. Move it
> into sun50i_cpufreq_read_cell(), which takes the cell name, so the next
> patch can read the A133 cells by name.
>=20
> No functional change: the existing users read the first cell, as
> before, with the same length check, byte order and error message. The
> raw bytes are now held in a __le32, the type le32_to_cpu() expects,
> which also removes the sparse warning "cast to restricted __le32" that
> the kernel test robot reported.
>=20
> Claude Code (Anthropic) drafted this refactor and its message; I
> reviewed and tested it.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603021703.aBD0w99y-lkp@i=
ntel.com/
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

I've tested the series on A133 "marking 0x1400, bin 4, revision 6: speed gr=
ade 9":

Vendor build had scaling_max_freq =3D=3D 1512000.
Upstream before the patch scaling_max_freq =3D=3D 1464000.
With your series scaling_max_freq =3D=3D 1512000.

I also tried to set 1008000 and 1512000 and `mhz` tool
reports cpu_MHz=3D1005.475 and cpu_MHz=3D1509.625 respectively.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0drivers/cpufreq/sun50i-cpufreq-nvmem.c | 55 ++++++++++++++++++++---=
-----------
> =C2=A01 file changed, 33 insertions(+), 22 deletions(-)

