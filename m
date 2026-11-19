Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHa2e4RK;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=auu7G3Kz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=; b=OHa2e4RKz+gcLa
	4jZGf57zB8eneEDcQdHMxh1slDgfx4uoR2s93zn3t5cyvqb8ocLBEYKkwCohrzS16vFvpFwlYJ6eF
	8AGNH+y6p3hsvEYH4OyBXNwOMoq2zD5aCuJXKtK38blDHqQlJwzlyUA/4UxZeFc9eAs+QGkjLCrxg
	sPsW8Q+GvouM1x2HawnZ9oHQrBZozg8PL51rg1qrBpDTH1zy+OBmNVIWTzyrfehvEwuMZy8/M/6zd
	bG6Q3byVSDgpWYQQB6BvjxNFNDpkj/F2L9lcDZbQhe7MhTgiCnH/hEixcIoEVoRK/yuOHFon14JJX
	jadCYKixWqhsi1UsZkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyJI-0000000BNL7-24ZG;
	Thu, 19 Nov 2026 09:20:04 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyJG-0000000BNKP-2qr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:20:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so143284266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080000; cv=none;
        d=google.com; s=arc-20260327;
        b=HnWGEiNycQrBfmIVyuduOO8gvCV5lBTDEjCIwBZ2sV18hfN4pbJGetrngU6R6n0LiE
         1UR92NcNQxaxP6dXVD2rIw5LmxQoLWXLo9U9iqOdSl+VzcrMWjbsoQ78YXow0E0ho5On
         MwyYksgytT293A67K0YOs41WTQEvcdiE6F9/yo66JI7v90BlKTY8LHkhZt2X6At0Rpq2
         or+IC2o0BejAUu/7ke4jnzEUm9xxqC1qmLJl3HKHw9l42/guRLP7Ha4WIxBALNNq3ueS
         ro+L4prE27kD6yDtJzLxbrLN1HTLA7QWMSL3d8OLf2RQdUXKJ2MuEKuLt6jo8PJkCyez
         q7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        fh=gxG/mfRviZnC0vcwEOjWNqgtbqCm94WB/ZIRm4/jchc=;
        b=sXQAjtL+NjKCF4iDzuMaHQVGawogPs9OGEjkYoJflN8xo/Rsre3B8zwFQeZ4MTkSTe
         roTTHasQfRU82fKBh1u6NwJUMm7MA/0zcXsNrqTmMCHM+dUpOSdBjINJhqVYVOrcF01M
         Ys1rPVye4rvJDmGZAHAGP0a5JGHUDEInKYfoVx41pv8lMfo0l3lhoV3HU25HlGmDJYD0
         peoQKt9sGFSq7JWBoFHusQ+e49kwlXBWAU5j0zvFsBMXPodX0zlziXqRR869Br54VtpN
         7XQ4Z/R6WbMURRR5CRGh4JrTbd1XbNe0rw01793vnwNwc7yH9immnEA/sanPe4KG1mRk
         iMhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795080000; x=1795684800; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=auu7G3KzWTq/HV9mhmxcQ0aPFC6iAMhg79klgaO/deTuT4NUiCbTZU+j/HQlmWHaK3
         rN1hbIjcBWEGBccNiKxK77wKP4e7umQ0+tr52QzIGnnsrYveBNy+zPGXGT8BSMC6dSl1
         EsRbRWEDq7meCWTarjLnZAR7DG0AsbyzWSDqzYOSwD8ESGsA/BzcspX4Zfa3GmwH724I
         jOXfIpNQ4UxEAFCsr0dNmj/fTgtLMUnr3ycw184XtL3S3Uca9/CA8ixL+Zb+l/gBb1Dh
         tC26loMd23iUG2SamUrjmwchKb3zKhyDq0cexStn8Plp+51ifsMLBoN1y/f8DE5Z3pUe
         KrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080000; x=1795684800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=TxXDwXtugIgkaoehh2ET8WpfxBL5RYn5NS5hHSJ+xkBeXd9bm6UW5gtMnlk/WZ4iW6
         yQXWDwP1BHhjO4W8Z8V0Q4dOwP2qYHQLnOqTJ21mw39UN3xmrNne1V4SifvH2aMVT9rD
         MJoSkc6pW+82OZ2ziyvyL9a6K7yG9JpPvb57AFXsZS1W5F03NuaeHcB6l70kiGO8jYQY
         GykI1eQ8HUlFYAg1ITiNJ9klDap7nV4U2RS1+KTjrIqmn+U+WC9QPP8WoDrQyBJ9UqVi
         qtAg1V99DXPdlTRTVsnGrL7CBIPTnxSFlyTZLF3UmSrCzYCWIDff0Fdtt99OD0Kprls3
         cs1Q==
X-Forwarded-Encrypted: i=1; AL+hErEImuwRIp3r7opi+qThg+OwIzAkSmTPc5z9KjtaIsdKx+wIDp7JR5nyJdTRBA399c9FsIx+xW7r/8lzQcrezFgy@lists.infradead.org
X-Gm-Message-State: APuU4Z96WiRRf84hYwxV+u5kkA9EuT+Q65Hjqmf4SKcOnzvQ0XXBhsoZ
	xZK4db0bjb4PBBvzMq/kCtnl2Ytr8lIGbW4v2SajhJE60bbBu8pIPYwIFgFVVau+mYhB95EZ9jX
	kpgZa5Z9UiqKTUGeSKMUG8mLDFFPesedt6I7FeDlMpg==
X-Gm-Gg: AYBFou2b0pGN34QlcitkWK9zkyrmi3CATaHKBj+udbtfTgQrJKswD/ZcRC3pbPw7Bqt
	4K/MyG6hQKj4zag3ieev1SkTMw2pOUT1AvwpkjouuY1Qm8YXW4Ue9qMhfHM/8I3q8C1WQTMCBmK
	FS++D/gX+RjxEBevXWZSAoyWZSjctuknPSuchTNoUCjiaiOtBA1ZdsmqJhWx29FEqhO59JlaOm3
	cd93o/DfG65dwEqbhPI0k/j/5ea/Gg45o0znNTT0zebD36YRq4Q1I5Vdbl3Fd10d3j3LmBV0q8K
	7i2RPOJj56JnyQOqoNsUfe4cJ0GCRK0C2SNJmjR/FveFZadxEeY+/PXaaQR9vxtVDR9UuAVWgmD
	Xr/+lWAW5GlQxvbl1yFtVtVrV3MG3yNDSHzi/p131RwMVRiiMVn+RzCb12SsUhmPwfuEROQ==
X-Received: by 2002:a17:907:9692:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c51318163ecmr59215466b.13.1795079999707; Thu, 19 Nov 2026
 01:19:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
In-Reply-To: <20261118184729.2302130-3-m-malladi@ti.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 19 Nov 2026 10:19:48 +0100
X-Gm-Features: AclHuK8e8ffnAD8pzuAiTxnaJvnDKX5k-oyRRYloR7_BmjnaSSX9Hh_xNi7mzEk
Message-ID: <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Meghana Malladi <m-malladi@ti.com>
Cc: kees+treewide@kernel.org, laixiangwu@cmss.chinamobile.com, 
	philippe.schenker@impulsing.ch, haokexin@gmail.com, devnexen@gmail.com, 
	horms@kernel.org, jacob.e.keller@intel.com, sdf@fomichev.me, 
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net, 
	ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, 
	davem@davemloft.net, andrew+netdev@lunn.ch, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012002_765673_2F780834 
X-CRM114-Status: GOOD (  10.00  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed, Nov 18, 2026 at 7:50=E2=80=AFPM Meghana Malladi <m-malladi@ti.com> =
wrote:
> [...]
> +       mutex_lock(&emac->rxnfc.rxnfc_lock);
> +
> +       /* Check max rules */
> +       if (emac->rxnfc.rxnfc_rule_count >=3D ICSSG_RXNFC_MAX_RULES) {
> +               ret =3D -ENOSPC;
> +               goto unlock;
> +       }
>  [...]
> +
> +unlock:
> +       mutex_unlock(&emac->rxnfc.rxnfc_lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(icssg_rxnfc_rule_add);

nit: instead of mutex_lock() you can use guard() [1]:

    guard(mutex)(&emac->rxnfc.rxnfc_lock)

and remove all the "goto unlock", returning directly. This handles the
automatic cleanup.

Same for other places where you're using mutex_lock() / mutex_unlock().

- [1] https://docs.kernel.org/core-api/cleanup.html

--=20

Marco Crivellari

SUSE Labs

