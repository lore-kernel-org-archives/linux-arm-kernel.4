Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8CA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WY9pkeND;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q8ly7s8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vaTxSvR5uRGznwAaCzW/CZ+c+SqZLPHFjqdiifAy+hc=; b=WY9pkeNDJ55+Z/wZZ1Ud1qjwY9
	UoCA7zKxnAlbt1Pb7TVaShjlby03H6hHqrr6rjsGPJUxrj9lvRfEqIR8zai/w73IOFWqZ1wGyO8SY
	dcvo3pyYWzLjLVZX69pNjb2Au+oRwGouaBdg8YuGiZBNziZN6dtqMkU5AQTZFdQ0NnWSYtFM+54nV
	BoPPZlcH5u1ImdMo4JgMKI0atR8mxSGbYApzgYdm3xPxhrRdj3UJsscfE/J9VVMJY0z7s3XeeokqS
	2e2t8n4AYvvk+V134+K+dOJguKAn6JUELeCnO9OxWRlN60bdnE3VPKMYYFJ9LvaDV8jf1d1Vj3IkQ
	Lj5GcAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaTv-00000004nym-42Fz;
	Mon, 23 Nov 2026 20:17:43 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaTt-00000004nxn-1ijf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:17:42 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-55b8cd4e2abso41828791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795465060; x=1796069860; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaTxSvR5uRGznwAaCzW/CZ+c+SqZLPHFjqdiifAy+hc=;
        b=q8ly7s8xUOlhaKs5WWiKhd9nfKGNSLALiW7zVoIpzj4/53SUrmPXuJHWX11xrxMQfY
         1x4u2mLeD9/+oTPXaZQ7HXfRl5A3Xe4c0S7Ak8x0b8658/LxFJp4N8ro22PaxL8GsvOy
         e4aYpgptlf6I3vSLyjJuDRF5Q0pJZdSG10FiWCU7Yb6KqI0SZuHojnFs2DFu39Qhgv3r
         DN0dO/sxJ+g6Jizn/aIGVCaBcoAu3e6nwA3NjHlO28q5JhxtsQIADXtDWbJ2HlakIgW8
         SoczXlPZFfPEaUt/bxYr3fmUFHNV0SBxBe1pKNnXFfWF0zv6LZ6NJBe/U3qlji/ZJ403
         Sp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465060; x=1796069860;
        h=mime-version:user-agent:content-type:autocrypt:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaTxSvR5uRGznwAaCzW/CZ+c+SqZLPHFjqdiifAy+hc=;
        b=k7Ta37YbBSuBGvzy/9LOG2tML3t2dLV6Dzea4g78GCjYjDv1p2rIKB3+HX0ywoe1Fu
         lId9ajuIr9YZ+TSFmRHiwCKMaDutuIH/LOEeHXMB1amGMUztDzedpcWol7WBUo1lEGMw
         djW1EiEiARsXE7K1R94xAIK1eHWIjEjVTrMUpsP5jrPXnY/rhTBFJjiWiGouW3bnet9g
         KNK5OUDvW370XrWNxrurQcXd0Ro+BNfIS568blIQFlpEq/MlpVbSiXYYyDhbg3A7+Zhh
         18gGyrJNjzgHMlys6T7FyYMpmCyn++i8MIJ7I1LZIywjJ7y7VRt0FUDhekTlj8aZg+c6
         m1/Q==
X-Forwarded-Encrypted: i=1; AL+hErEZcIeoswJXHhj7B51hqCIKkUUBHEI3pZO0aXi5uVtkresTJIhaz5FrfWYEacn7NGGZ7HZRMyTcPXuflcrs+HZT@lists.infradead.org
X-Gm-Message-State: APuU4Z+oRzDNj1hBKAn14zqjMG1D0rpwqINs+q8C6lYfvIhjvp8DfA2G
	2dkGmTbyy+Y7BcmCxiZsHtFnAEYfJjBWcXtwVk9LixjDJUQ3XRdqSxicuR1/kDhb4RM=
X-Gm-Gg: AZFdTZdLmJSFV3cKXviOvWhBOOKTffOxWZRijVH7nB++Ay2G02JD/4n76Gonbdp0SL2
	r4tC/sEcoLIbsnAHh8h04/ALIDwrZqsNT/MiJql5TYJ7EBAv/wh+Md610aYV6Wip7oxz77tvnHl
	5gH1NI3NxgniesDP81GuGczidS1B4J3gHLiaw7IVPyVHabokwm3v3LOLUJeVKnccW/KEGRqmsye
	LOSymtX/av4MZ1Nfafn9KjE36DuKyuRCfaIo8CvqQfUEZSTAUAR4poHXBdJWTSpeE8rVH/clbHl
	NgnMpISGXLERNnUqapmQTwm/tQo8S5KlbsTfmnXiX7W8G7qxuOLdZeKUwpR2w9kmCuJaI3QETxM
	FD6XM2jACdfkVtKMFi9N+WMt7AixQPod+A74DiPTSuy7aELZEnTDuY6zct8joXCZwint4eoOKwI
	V/bCKha5pPjdtOg9F1EYaibmqJ+ql9IztLIZDIdDtsufhMZ0FmjbRhjzhyKWpsFpuCJCVQw+0w7
	b0Pn8xtfYJMeSAvNrkTAWKIXRyRe5n6byCVfvX+9T4u/oeqeBAWNJj9NZqm/IBo44VOsCm49j5w
	ST5gW7lnCfCQ5LHY4mB3c7dwqgGXOMs2vMyQwio3MZacTnqzmxrI2F4=
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr2056425885a.0.1795465059662;
        Mon, 23 Nov 2026 12:17:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca846322sm695648785a.34.2026.11.23.12.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:17:38 -0800 (PST)
Message-ID: <104c4805de06b15ce0701c026de4540b19016b82.camel@ndufresne.ca>
Subject: [PATCH v2] media: verisilicon: suspend the device before
 unregistering it on remove
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergei Khomenkov <shomenkow@gmail.com>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Frank Li
	 <Frank.Li@nxp.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>
Date: Mon, 23 Nov 2026 15:17:37 -0500
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
	protocol="application/pgp-signature"; boundary="=-uwgP2ITtTeUtNsVLr8YC"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_121741_573249_65BE1001 
X-CRM114-Status: GOOD (  18.39  )
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-uwgP2ITtTeUtNsVLr8YC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Sergei Khomenkov <shomenkow@gmail.com>

The clocks are enabled and disabled by the runtime PM callbacks.
hantro_remove() calls v4l2_device_unregister() and clk_bulk_unprepare()
first and only then pm_runtime_dont_use_autosuspend(), which suspends
an active device right away. By then v4l2_device_unregister() has
cleared the driver data (it points to the v4l2_device, the first member
of struct hantro_dev), so hantro_runtime_suspend() dereferences NULL.

The device is always active at that point: the driver core resumes it
before calling remove(), and its put only starts the 100 ms autosuspend
timer. So every unbind and every module unload, with or without a
decode before it, gives an "Unpreparing enabled" warning for each clock
and then that oops.

Stop runtime PM before the unregister and the unprepare. If runtime PM
is forbidden through sysfs (power/control set to "on"), the device is
still active after that, so disable its clocks and mark it suspended by
hand.

The probe error path unwinds in the same order. It can only hit this if
a job runs between the encoder node registration and a later probe
failure, so it is left for a follow-up.

Fixes: 556ab0b2741d ("media: hantro: release runtime resources when device_=
run fails")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---

Changes in v2 (maintainer update):
- Slimmed commit message
- Re-use hantro_runtime_suspend() instead of open coding
- This required moving code around, hence posting it to be clear

Moved outside of the commit message:

Found with an LLM coding assistant while porting mainline Linux to a
Rockchip RK3026 board (G1, ID 0x6731); the assistant also drafted this
change. Tested on that board. Without this change, unloading the idle
module (runtime status "suspended") gives the warnings and the oops.
With it, the idle module unloads with no warning or oops, and so it does
right after an H.264 or VP8 decode with the autosuspend delay raised to
10 s through sysfs; the clock enable and prepare counts are back to
their values before the load. The same holds with power/control set to
"on", over three load, decode and unload cycles on one boot. kmemleak
reports nothing after five load, decode and unload cycles. Built with
W=3D1 with and without CONFIG_PM. Not tested on other SoCs or with a
power domain.


 .../media/platform/verisilicon/hantro_drv.c   | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/medi=
a/platform/verisilicon/hantro_drv.c
index 70a2bb39777f3..55480ff1ca57f 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1285,6 +1285,14 @@ static int hantro_probe(struct platform_device *pdev=
)
 =09return ret;
 }
=20
+static int hantro_runtime_suspend(struct device *dev)
+{
+=09struct hantro_dev *vpu =3D dev_get_drvdata(dev);
+
+=09clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+=09return 0;
+}
+
 static void hantro_remove(struct platform_device *pdev)
 {
 =09struct hantro_dev *vpu =3D platform_get_drvdata(pdev);
@@ -1296,10 +1304,16 @@ static void hantro_remove(struct platform_device *p=
dev)
 =09hantro_remove_enc_func(vpu);
 =09media_device_cleanup(&vpu->mdev);
 =09v4l2_m2m_put(vpu->m2m_dev);
-=09v4l2_device_unregister(&vpu->v4l2_dev);
-=09clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+=09/* Suspend first: v4l2_device_unregister() clears the driver data. */
 =09pm_runtime_dont_use_autosuspend(vpu->dev);
 =09pm_runtime_disable(vpu->dev);
+=09/* Runtime PM forbidden through sysfs: the device is still active. */
+=09if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(vpu->dev)) {
+=09=09hantro_runtime_suspend(vpu->dev);
+=09=09pm_runtime_set_suspended(vpu->dev);
+=09}
+=09v4l2_device_unregister(&vpu->v4l2_dev);
+=09clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
 =09reset_control_assert(vpu->resets);
 }
=20
@@ -1325,14 +1339,6 @@ static int hantro_runtime_resume(struct device *dev)
 =09return ret;
 }
=20
-static int hantro_runtime_suspend(struct device *dev)
-{
-=09struct hantro_dev *vpu =3D dev_get_drvdata(dev);
-
-=09clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
-=09return 0;
-}
-
 static DEFINE_RUNTIME_DEV_PM_OPS(hantro_pm_ops, hantro_runtime_suspend,
 =09=09=09=09hantro_runtime_resume, NULL);
=20
--=20
2.56.1

--=-uwgP2ITtTeUtNsVLr8YC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSfYQAKCRDZQZRRKWBy
9KeKAP9CcDZUI34xMYJIMGncXf4XJcb7fZENpFaEKrlq8u8HuQEAgGgRcRqx3b09
Fpe+wdqI8J1FIvo6R7IA/MeN6qQXgAM=
=ZcMk
-----END PGP SIGNATURE-----

--=-uwgP2ITtTeUtNsVLr8YC--

