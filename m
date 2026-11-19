Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EEF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3V6N6k1;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=swsCxL8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IyK0zWdJYWNP1b9cS0YOg9yhzbb31BwYb4X3D+Fxp4Q=; b=u3V6N6k1r45dJ3
	dqr1dyPJdVTe3SKWs4AemSv5DYKgvTD3sXPK/HKG8evCNZMBoGlMS8MASYdCGXX6M2RkX/MEmCRtd
	1sl8FgnZNEENM6Azw11bH+3BuNwjucvVES7E3IK3H7UDeeZv9A3fxa4okGjlwa3tb3rXTwR8FuQUD
	hZaD69IGLmvPrY4+bgS6PWzFMqP/2vtK99nJC/6f3a+TjwBuMGIxGgmc6K4fKy1jM6JdmxDmgMthe
	FzgCLxJzWOLQ5htUMJuxl3dVPW8S9NVMPxBIc3S9b9LMTru3pd9+Y4cX4quYH6SOd5wxYgCTsLbB+
	ZeV3NPGBOaRIz43Vlfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyjT-0000000BRLo-3SPg;
	Thu, 19 Nov 2026 09:47:07 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyjP-0000000BRIs-1sZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:47:05 +0000
DKIM2-Signature: i=1; m=1; t=1795081619;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:hwHJor1FHo35L4L3u3N/PJtOz5MB
   ULThDeZtmRulLsAGVmzgRQu1zM2uj/F5iQwYWVn36fRw+rXMaP6ndy3rl9FwxHRlcfkViCtB4K4
   8EHpNfTk4OvMSQuKmMErRAx3pViBUdMXxc+Zu2No2FTOr9QAoKCY7pdzXcdq4Z1IncjEdkzoD9+
   SSLA620WBGIfYBEYrNlQ58us6mt6drSc8Jq3C5xv0ZkbGYuXejUQ9jt164+b6fAQWYAWqncVEEJ
   GViPfeMKtY7oixiKVPJHqb+J9ZZGz3xFP5u4+p8e4wZsViUeD2XzW4vSQK4vV9ISTamX7GL6Lz7
   eAJUzsG02zO+Ew==;
Message-Instance: m=1;
 h=sha256:
   B105xMYeUfsO27wkRhEg9G+BYpX8HAJSEqi1QgMgl1c=:
   IyK0zWdJYWNP1b9cS0YOg9yhzbb31BwYb4X3D+Fxp4Q=,
  sha512:
   aLP6HEOJsN/CBq0mO/s6gqZvZFsj7wHeiUVULVO6h/n9hWsPvOagduiVcng3dZv/cxUGgNwr1t34BZwbQQTFRQ==:
   jJvxO+T9icTBg+CxTQVFjMRaBSFAamBRrHx7OMOHmaPF1j/fu+YT4scnCJ3XzHj3UaJJTGOr7V3f+MzHvLxJGQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795081590; x=1795686390; i=markus.elfring@web.de;
	bh=IyK0zWdJYWNP1b9cS0YOg9yhzbb31BwYb4X3D+Fxp4Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=swsCxL8lWxxqKtkPZ/7ZfA/mwHMZ5wdEyu8hGnwM0FoCOewunlSBHi0/sDUPbNKk
	 VMa6IefZnKA7A8GwE/9lZn6avdvpRpDkHFXbyz3yWGfskPxTp5E400V9grMyH3Ar+
	 wVm9M0VY1adrTLpUh6wSD1f+heCMnVHrQSDLRC1lHJ9mFXPyZF7Bzy8meiTTR291D
	 VkYv6NYeIht0GHcuD7+K4UMkOL0Uf00u8pi8M3otmCrLus1kj1y8vQEAtr0kgRnNe
	 v5C0MhgiUMlfyYp8xnP9X2Bt+fUpL7ETMz0xFMXOlT5KhScgnATqJggD7dp94bqmt
	 ZvoSOGAKPfAnKPdJrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1xIBwZ2nIT-00Bt0m; Thu, 19
 Nov 2026 10:46:30 +0100
Message-ID: <e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de>
Date: Thu, 19 Nov 2026 10:46:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fBWk+Lp0zWy+NPXwJPP65U9e7NULjJZ17NFP3lytPhktc4QqlhI
 hmLMFQR8re3zWxeJbb/BaeurvT4H9TMrjZ04TPBoRZD+2bKONOinnFFFn+otZdfBZ4VW0u6
 mRwS6fr9oYR0xy9/PpUuIIp5/yk4ux2tDSpgakiaTJG6Xk/MLhO50SMZ+64A4a2spcL1ey2
 +nNiGF6H6eCZtKW2IX4NQ==
UI-OutboundReport: notjunk:1;M01:P0:1KhtnqP6vVQ=;zGtR0JrYi7lzddk+qqmANxe7zhp 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 Zbr7/XN3Cej8MRHzEceQgNG1jvOVRP4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_014703_766040_7FECCBDD 
X-CRM114-Status: UNSURE (   5.36  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> There is missing return value check from clk_prepare_enable(). Fix it by
> using devm_clk_get_enabled() macro.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.4-rc3#n145
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv7.4-rc3#n34

Regards,
Markus

