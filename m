Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A44D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZ8PCAY8;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FjxgaMu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CsToAmSO6EM5upB2OwH3d/DztOrAnzWeR1RqF8Z8aus=; b=rZ8PCAY8ypsrbqukMlfbDZ+21V
	iszd0W+EJg31CirrIJU8RHBA0Zc6x3yl4bhD0W3bk49oKpOST7l7564tPwxjWPB8+DXP2Z8SkHdus
	nROCsaQUc2W4wvqufKnPDSbfhskSkXHZv1pJDBGSGDoLocI3jFeXAZxwvXu2q0EQOTVyl729YSDg+
	IVyWp368qfcCm6YtHbKAmYuPglNxgRd7Gc1dJVO98rv5VXkvVLmc2UGL9ssKPT+Yt+8qS/B1+8h+E
	rsW+GqSHWBWiGTCrbos+RlZtQ9FAcfAgcJwx4YiUn8100yCx9kByYQM7+YV8/mfvTlFlv3BxNTXkb
	AI3JxmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWvH-00000004CBI-1VJR;
	Mon, 23 Nov 2026 16:29:43 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWvE-00000004CAj-1XR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:29:42 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2f04f61282dso13233045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451379; x=1796056179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsToAmSO6EM5upB2OwH3d/DztOrAnzWeR1RqF8Z8aus=;
        b=cqMhkVecLXpzmP8NRsA8xh4pZG1yF1jC5gZT03EGUe2GCgwKvBHzIgSuRPfR1gDpXg
         Une3cWa+yf5eK6yZJs1yz37FxmBNZIJ4TKPhkFJw7qt/6LjT+ufFGhLCgO0EUJv44DrJ
         lAShqzwv5+4S598nNk4WgC8rrs/lF2wAcU1vYMXFnJpYtgmR+BQq46IBz1eulvH5o4Jx
         avusRGYUGuVVecYjaKNCcHPLXh4TsfyeswLm7h97YgDR+KmV3QZLwcMWPTHV9wD1T3Qt
         JyNwLE0a4BioCW9lNi+7ynjAg5jISjXmXI3wCg6hfv97k6PzEO36FOhFOKgFKIZvWzZo
         5cKA==
X-Forwarded-Encrypted: i=1; AL+hErExUwsgP+zqMDGcv4iNP1smBIvKPgJWhfD9OyovoEWAGexLL3J6nx6T23poSuoackyTF+DrqwQJVHrcfoLzzfXH@lists.infradead.org
X-Gm-Message-State: APuU4Z/2BJrpf20GYVfnz5hMNvEwFxziq3HXmaN2pzWjCqgx6LYp44aJ
	e9VlknfA3TsNUdGmzisQI0PRZrCXN5Fair2QwXOpcM27FCG72fI7FF6IHhEnjEZ2xXooEQttLHH
	eZB4FxinFH7CaCgEeiz0ER2FmQRwNsS992Gp9NQITVqoAAiDqDnvg9j/M83cmB6Ja4tfUzpq7us
	g2Kx4qlGLHUpjk/7K3DGQE/PJiJemZaGfS85vqCvhvSme/uOxYI5rmftzJS0PaZcHjbxCZT0t1e
	wciytxCdIue01hD/Ig+PjQ=
X-Gm-Gg: AZFdTZcbM/c4J4vjhCNomYX1pi4+PFF9O/1ppJxVpx5RZh0G1+dHM/vkUkNB4OtR6hg
	YVEHBI1u5ILGYdz/wp2iwBt4FghIc0lJvgwR4kC/W0n/9FOoksYxoi7WvoDHjDuonjUAVNnamgn
	BZzUHYWuohrjZylGTd3+PaRH4AEfJXSeiM/LfVqcJOilu5USoPsP+Yz0DrJn96ijIkEzaWazXkn
	2bTZS9tcAhM3dggcZnqBOe1uuiABtTbYkVrKK7aJDYYQb8SkDi3l5y/cHsX3b0ICzAhUXOnnSyH
	KqE891GGrnhYbFdXn39lz6yqwlWCizBGe2w7XalvMaGggqBwnliQhiP5R2CgX8zwb8ad6lPITmo
	k1qvFxlRHJX9myn1MyoM3JILPXP+pKs3AvufCCHgLNEdNJDIvR6+lk8GvB9YBqD+w1a1ZyrCHMi
	xsJxHjF6hQtWdnww4HpUvBefvwsQPwIJI=
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr10804401a91.51.1795451378797;
        Mon, 23 Nov 2026 08:29:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfce08fsm3984851a91.0.2026.11.23.08.29.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:29:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213659143bso5090686d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795451377; x=1796056177; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsToAmSO6EM5upB2OwH3d/DztOrAnzWeR1RqF8Z8aus=;
        b=FjxgaMu/BeVlLmQ6sqmvO0O0kwu00jKfWH2P6c5aKyPIVFaauadmNW5kJyXZdkmA2H
         1rNanUBxyGkRynDbl3F2dJIYxYJKD2HvYgwJfYoWvmpowHTXIi3kqbUmKBdxSV9J3ext
         7cOXWkm/VDmKWO/MWg1W7ZOBxrhk0vdFy/Kp8=
X-Forwarded-Encrypted: i=1; AL+hErFPJ8BMfWTPBIsazHOloAfcp7w8LOcnVxnVi+5BXcoaBNuNBDVmaRa+v+h91ALXoOUttUG0tnssngLQCe2RzGY9@lists.infradead.org
X-Received: by 2002:a05:6214:3288:b0:91e:9db6:c32e with SMTP id 6a1803df08f44-92134a873c2mr203211136d6.36.1795451377405;
        Mon, 23 Nov 2026 08:29:37 -0800 (PST)
X-Received: by 2002:a05:6214:3288:b0:91e:9db6:c32e with SMTP id
 6a1803df08f44-92134a873c2mr203210586d6.36.1795451376808; Mon, 23 Nov 2026
 08:29:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-iproc-shutdown-v1-1-05f828561116@kernel.org>
In-Reply-To: <20261029-iproc-shutdown-v1-1-05f828561116@kernel.org>
From: Ray Jui <ray.jui@broadcom.com>
Date: Mon, 23 Nov 2026 09:29:24 -0700
X-Gm-Features: Aa3M54oDDtkac8E5zSck34l9HDb6TSOSdU0PDlUZau7Sgl6E64U0spdnw3ToPMc
Message-ID: <CAJ8Y1dTkH0vpPNO8a4LDp53g9D+jqifsRaKBpLWxRNR2eR3GPQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Fix MSI shutdown operations
To: Eugen Hristev <ehristev@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Marc Zyngier <maz@kernel.org>, 
	Vikram Prakash <vikramp@broadcom.com>, Anup Patel <anup.patel@broadcom.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000098c4250660f419d9"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_082940_419492_19D94674 
X-CRM114-Status: GOOD (  23.29  )
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

--00000000000098c4250660f419d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eugen,


On Thu, Oct 29, 2026 at 12:36=E2=80=AFAM 'Eugen Hristev' via
BCM-KERNEL-FEEDBACK-LIST,PDL
<bcm-kernel-feedback-list.pdl@broadcom.com> wrote:
>
> On reboot, shutting down iPROC leaves MSI irqs enabled and not
> cleaned up. This can lead to IRQs being served after the iPROC
> was shutdown.
> Fix it by implementing an MSI shutdown procedure, and call it
> before the iPROC shutdown.
>
> Assisted-by: Github Copilot
> Fixes: 3bc2b2348835 ("PCI: iproc: Add iProc PCIe MSI support")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc-msi.c | 16 ++++++++++++++++
>  drivers/pci/controller/pcie-iproc.c     |  3 +++
>  drivers/pci/controller/pcie-iproc.h     |  4 ++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/contro=
ller/pcie-iproc-msi.c
> index 9ba242ab9596..1d19db67f314 100644
> --- a/drivers/pci/controller/pcie-iproc-msi.c
> +++ b/drivers/pci/controller/pcie-iproc-msi.c
> @@ -651,6 +651,22 @@ int iproc_msi_init(struct iproc_pcie *pcie, struct d=
evice_node *node)
>  }
>  EXPORT_SYMBOL(iproc_msi_init);
>
> +void iproc_msi_shutdown(struct iproc_pcie *pcie)
> +{
> +       struct iproc_msi *msi =3D pcie->msi;
> +       unsigned int index;
> +
> +       if (!msi)
> +               return;
> +
> +       iproc_msi_disable(msi);
> +       iproc_msi_read_reg(msi, IPROC_MSI_CTRL, msi->nr_irqs - 1);
> +
> +       for (index =3D 0; index < msi->nr_irqs; index++)
> +               disable_irq(msi->grps[index].gic_irq);

disable_irq is probably not sufficient here. disable_irq uses lazy
disable and leaves the hardware unmasked.
Also, nothing will be syncrhonized in this case, disable_irq does not
wait for a handler running on another CPU either.

'irq_set_chained_handler_and_data' should be used here.

> +}
> +EXPORT_SYMBOL(iproc_msi_shutdown);
> +
>  void iproc_msi_exit(struct iproc_pcie *pcie)
>  {
>         struct iproc_msi *msi =3D pcie->msi;
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller=
/pcie-iproc.c
> index afb3aa38ac6b..6f3dc2f81a1c 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -756,8 +756,11 @@ static void iproc_pcie_perst_ctrl(struct iproc_pcie =
*pcie, bool assert)
>
>  int iproc_pcie_shutdown(struct iproc_pcie *pcie)
>  {
> +       dev_dbg(pcie->dev, "quiescing MSI before PCIe reset\n");

Please remove this debug print.

> +       iproc_msi_shutdown(pcie);
>         iproc_pcie_perst_ctrl(pcie, true);
>         msleep(500);
> +       dev_dbg(pcie->dev, "PCIe shutdown complete\n");

Please remove this as well.

>
>         return 0;
>  }
> diff --git a/drivers/pci/controller/pcie-iproc.h b/drivers/pci/controller=
/pcie-iproc.h
> index c4443f236ca3..54e6e365774e 100644
> --- a/drivers/pci/controller/pcie-iproc.h
> +++ b/drivers/pci/controller/pcie-iproc.h
> @@ -114,6 +114,7 @@ int iproc_pcie_shutdown(struct iproc_pcie *pcie);
>
>  #ifdef CONFIG_PCIE_IPROC_MSI
>  int iproc_msi_init(struct iproc_pcie *pcie, struct device_node *node);
> +void iproc_msi_shutdown(struct iproc_pcie *pcie);
>  void iproc_msi_exit(struct iproc_pcie *pcie);
>  #else
>  static inline int iproc_msi_init(struct iproc_pcie *pcie,
> @@ -121,6 +122,9 @@ static inline int iproc_msi_init(struct iproc_pcie *p=
cie,
>  {
>         return -ENODEV;
>  }
> +static inline void iproc_msi_shutdown(struct iproc_pcie *pcie)
> +{
> +}
>  static inline void iproc_msi_exit(struct iproc_pcie *pcie)
>  {
>  }
>
> ---
> base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
> change-id: 20261029-iproc-shutdown-abbbce302daa
>
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
>

--00000000000098c4250660f419d9
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Kea1UXiDNimY9XcISXAUrVauS3TPqfSofCP4tOVkOfR2zFsciCJ7DPbmanfMXAR2cY6kCgkZCqxY
9Szy6beT2XZUSE9/jFymRSjXZNnLqAe30YCaVeVQUqW9X3NqlPdzO9Ce8AqKdgBlVt4isO6s3zJ5
djaWSUM3zrweXgaVpSRF3iBUxK45Nb0qOkvz0hrBYM2r+iLWR2YbF+Z7W7lw2QMvkbeT1gXn+4pC
K8f1aWKsB9e6Id7uBOkCAwEAAaOCAdgwggHUMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAA
MIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUD
AzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmds
b2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwHwYDVR0RBBgwFoEUcmF5Lmp1aUBi
cm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt
26AjhRiwoJIwHQYDVR0OBBYEFLfOZFpVhKW7s+LOyKdJX5PQH0f8MA0GCSqGSIb3DQEBCwUAA4IC
AQB5Y3tHNG503cqE6g1lZJG3Z1SbuQD8ZXUbYqDNZCnUAd/+zUCraK7TYIOI83X+oof/CscTxVhf
5mazzhESPjHYlC3TLkkxDHQZi06GwKbI00651REpC78vd9dOdZnKnGjpFeDiwJKNxdarSaYiZi/t
6cZD3FIvDaJwYIQ+8HvZOm7FBicC41sMoaxGWZ/tdC6yRoLFckWRvhq0e7wyaBOH2ae8l30V6NXB
RtJd4XemoNk74ybCcGMro0zyBCzQhREo2slK5r/uflroC607XCCIGjLuB6TptSxV97L/9/QSrE2U
4JteFGVwRBJw1s7k8ICf4s22debUZ+OlB0mXjI+8EUDt6vdMeregn5ilQQSsDmBMnz2GzHfV30tb
X92uoE5xui1g4Q3BWkUVwd9wVHaganr3rzc+lQDnQq5cddu1supu3SWp5FqKq36rtf3RX/3zHZ0C
P2pCAlilDHYH2NRF8CYb+gqFySS/PUxwPmFWuD897Hewokex+ux0oZscsuRe0IttCbYfjl/+tSA0
a6Rd+AmkiyASFgEHsLGl6q2OTPYU1PikjUe5RXTp0UC7bdPQXzxaORlh/KWilnz/kV2XblDdybuc
Qz3eVIGvTANnIqPpz94oImrgHX48hMGiH5gGNznLwDBoQl4ZSfvlSi01TcUsYlHJD3LRZWbsh4VG
PDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDCsjlIbQJoxUU3h/cTAN
BglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg4JjkGJkdpdOWsfeCnLoVagAQgKL7Et00
0Y8eRMmb+5YwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTIz
MTYyOTM3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEB
BQAEggEAqo6BmW/Cj9tlzEdB1S7Swovx7l26zI3N9dmfYaQwn6VB/fjOBOt0XhuqU8xcLkxOr/Fa
LHTrZWv6mkXdVkba4jI3Aoe8kD1sRTNpZXefXBIQazzMtjo9LqmMjElKzwOYJqg6lBjYaqbpzQV8
bEwFvL27YHZqdWApyPxm/GEyts8BxbeZy5izc/Fxs8y2vdkb8GFpV+nf5kWek83ibHpXaKqY7q8d
hvVsZpVyL+hbYljcUw6ms4xSx5XxNcn05vcqXYkl/dUsVVvJU/vGILxLPae9KaS2HKdW9VwjlRkm
Qd5RrRygoTR0JvEep9U4bsjSQ+POC/QMjCKjnJCT9b7Ihg==
--00000000000098c4250660f419d9--

