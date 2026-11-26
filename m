Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36DC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LbIx/0SO;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q/xdJ61i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=; b=LbIx/0SO2vff6ixmiEQNZJZ9/0
	k8VqEhFwFo5rApoQN73WvL7mjMZJDIBc82GlX/T3DifN9kJMEUI4PaXGIh4fqWekr3u9PKLD49s3o
	5FogbJ+sYFft4NHlzWIGv5YcJYfLG6xGNq483/hqRz+ebOjc6ZYBQBwTl4GDbC+OHfyRqfKLgyKE8
	RoIJZfvhhEfIWnGZ21AxD5RhFp4ssPlxtfJCsr5roZS1OouRMi29kSH25nOjh6DPUTUzuTg7a7qev
	mkHNctxMS61KyUYTHE206WWmWSVlZI9YIG5los95CZ5pRcnovjvqL6FMDIGKMagNGNNMqPPycH2lq
	r+tgzAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhPP-0000000EbmI-1Yl2;
	Thu, 26 Nov 2026 21:53:39 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhPL-0000000Ebkp-3cjC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:53:37 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-9495d543c42so740170285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795730014; x=1796334814; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=q/xdJ61i5yWw2N/eUrXQiuuXn6WzzGIdYG1YOFDqP6kopo+EpUkfi05ZJppHJa6A79
         qHgkOaW52CpdWzSm2kScoEIjoGewXQB4tTeLOxuHXjvqRJL95UR3KdnewEQXKms50eX8
         Ec5Lrz/3/fRtIywuOK4sVYkyeAl8P8+EkjZM1wqFD20TTBXlGj69CrThQEZ76dlne6ns
         Q/5ipJoGzDSIC1u9Z6p0PZzxenE7L/s1MScwr8iJPvgz1n8XsdasDWHZ889PFr6rmFZ7
         L+o7k0yalIw9R4DHCQ5+ahSF7ewsLxMtlzG79lnKFdSors+4DaJVCScOJlE0MvyZ6X7D
         xoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730014; x=1796334814;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=brTKXqdUk2ZPgznHqlyk0S11hBuZhC76D7pMsloW99GK+Q90EodRQcZO1UcfxpJyjk
         gWVvr25NHrprr0P7ejbSb0JdzpfY1ahR97aZFYHLWePip/NQcnNTuBG6+iYu7LJJ9+KQ
         UgtUrcBrqdrQzFelMcDw8seP4Hhq0/31PDI381hnHP8DgVQkVGImZabiNW+DMvbgvyU4
         ELLaqjVhC324iu08SenZpzJ4ZBSi/Ir66KcwwBxsyRphBsKFwmpFNfzgRXK0YVCB52Yz
         h+dcFIcEZCmZfQNwNgLovrMXl7oU7IpkhtQ3edG4Qt8NywyLPTyfUXS2Tt12HiUJkeu+
         FZQA==
X-Forwarded-Encrypted: i=1; AL+hErH2rPWdpjGRTjRidJ2u+dVy9XkE3m4+AkduSy78rBPNxFY3toPlBiF2npfFbhE0Zjqe0PEJT9T8eIDPbWb+JLZM@lists.infradead.org
X-Gm-Message-State: APuU4Z+7n41n65thjq9+6LZXKXxDweKUPQdT0Tye4fOZngI2gaZsFGkO
	C/rtMuk+Qdu8w+P5Ka08xNmqctKB2/GodiaU5Wr3eCEuI4/I3+cly5+VupOgo8xiCvE=
X-Gm-Gg: AZFdTZdgZwewFAnDQM+eu+sUOwLnwwiRXINGwku9bVKK8E0Q8mbXLYMQUtmm//RAcem
	piMyGpx65GgwPntl7sobgq4XRLwwApmESZnJddHzbTJZcYNfYYky0fDMfvC3OIFQlPjE8BfrJUh
	XRX+UnEfecIe/777DIXwtbTmAF4ehAZCsUil8YFlHNgKU6CEFFpBMEgSK1D9ILHKcd5tgf4jnGS
	w1bfr4yxMleZdCzu+Wt8nLaAwYN1Q3Me1OUnJkIVtisjRJOpHC/9AmG8bk0niOrFGD+iszyxriO
	P+o/5uX2BaZemAx+oyiAOJdqbyOe0IAwwMHh1k2u4Ju/Jl0Kz1PEOQv2ZK3jWSdAvcxOQdlx25o
	3TIOMjaulOMxqSCCDtawdMadHjmew/y+ctbhub5AyRvsIsV79C8na01I6iNUE3xHy+jUjRkRlGf
	yipqNyjVM8sU7wgBiW9D+bo4O5b2hpHtoH+s8dSlmyxltWsChZB6Zk4fYlQLQpq4iws7fo9LWqt
	F/F/xMuVXe4ztfo1o7P4Tid98ggHQ+ypNwznwyMK1LTCUl6bpnI7PcCk9jZ2QhxwnnAybvlyfz6
	UBCWTVHFIGtb/poXtTu0haMh9M/A4qPTTc2CfQNmHTwFbpbYdurOneY=
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr3721601785a.23.1795730014488;
        Thu, 26 Nov 2026 13:53:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1654907285a.7.2026.11.26.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:53:33 -0800 (PST)
Message-ID: <a7e72cdb67e7ab8578b9ce44a4817ba35d1f822b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: NUL-terminate debugfs input
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jiale Yao <yaojiale02@163.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Thu, 26 Nov 2026 16:53:32 -0500
In-Reply-To: <20261029053024.2526059-1-yaojiale02@163.com>
References: <20261029053024.2526059-1-yaojiale02@163.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DlJB1J9haeeqeVzf+bdm"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_135335_933509_D246D9B0 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 13:30 +0800, Jiale Yao a =C3=A9crit=C2=A0:
> mtk_vdec_dbgfs_write() allows userspace to overwrite every byte in the
> persistent debugfs buffer. The read handler later searches that buffer wi=
th
> strstr(), which can read past its end when no NUL remains.
>=20
> Reserve one byte and terminate the copied input at the updated file
> position before releasing the debugfs lock.
>=20
> Fixes: 5e488a4fd859 ("media: mediatek: vcodec: Add a debugfs file to get =
different useful information")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..8528534e41ef 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -77,8 +77,11 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp,=
 const char __user *ubuf,
>  =09struct mtk_vcodec_dbgfs *dbgfs =3D &vcodec_dev->dbgfs;
> =20
>  =09mutex_lock(&dbgfs->dbgfs_lock);
> -=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf, sizeof(d=
bgfs->dbgfs_buf),
> +=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf,
> +=09=09=09=09=09=09 sizeof(dbgfs->dbgfs_buf) - 1,
>  =09=09=09=09=09=09 ppos, ubuf, count);
> +=09if (dbgfs->buf_size > 0)
> +=09=09dbgfs->dbgfs_buf[*ppos] =3D '\0';
>  =09mutex_unlock(&dbgfs->dbgfs_lock);
>  =09if (dbgfs->buf_size > 0)
>  =09=09return count;

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiqXAAKCRDZQZRRKWBy
9HvlAQC+KcPKwSaD7Ix8GCPtMRz0njYszGlIhj94VYNm0BjnnQEA8O7IpD79HTUk
JcUCeKPKDEyp+qT34NJFPS+wfxGcZwY=
=kTt2
-----END PGP SIGNATURE-----

--=-DlJB1J9haeeqeVzf+bdm--

