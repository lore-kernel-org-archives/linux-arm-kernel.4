Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D01606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L1oNcnI+;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=rCJOHU7l;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Mqkqmao+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k8zF43mIns+8zEDRRffV7DY3yvSKsxnAizK8HjEE27Q=; b=L1oNcnI+JhDrcpEIBEjpf9v1va
	R6hFsd6A1WXovveoENgvEmMpiEP0l1QK/mcmNTV3CHtRP0qocZtrT5x/cmw6n88suo+Fo5trlNhgF
	yBKAuMrws8m8MFwVbPkOE0/SkDc63y8nIyyJqG7jGlLZs/84v8t7urxUPtQWcj8qWIjBsqUrF0Ghm
	u33yWIMPpk5atpAJvmphTOFjArClnjlOB3mjXXrVJBnZKpnwMIsZ1YVmh1KuDxGw8vncEFcoTpHS3
	D94qo4TwIzcrhX2hKjGCMu9LwWvnBJOaLTklNtlMvdg65fCNnig6mahbazkJYJBiIgtydnK8Md5gO
	jr8hyCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRrx-00000007FPS-3qmT;
	Tue, 17 Nov 2026 22:41:41 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRrn-00000007FN1-2sUB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:41:32 +0000
DKIM-Signature: a=rsa-sha256; b=rCJOHU7lbbHLruFIsMUQa8wjDMxuF/FoTcJzOOvjskDc7W8cg2OEzOMvcfXInGpfxRfnjbTmciON0ZQLRqVGweVLoIn9NwPoVTusytvLD3bjiyNW3fMgxfRcQZEGjdIT+Cys9Jj2xp0G9KgxXtIZXiN/1tKfisU23G/9ZIbKZqNTkg2MOo3FYhktxBwOu4rYq4y/EXzeAMf+ax4DeQaRrcJjk3nXBxetlTvROEcqEXs+JyCpyRSZpdGAmGI+3um9IshpuiTz3zpyPLbObmi+9sh2J2Js8YyL1VQWJKrsS8of2UitJztbF/VjOXKBejmkAw2eUIEqvBxarWW1v/D4Vg==; s=purelymail1; d=sverdlin.org; v=1; bh=k8zF43mIns+8zEDRRffV7DY3yvSKsxnAizK8HjEE27Q=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=Mqkqmao+KKtBnHFFrr50faPe+FAxgu37V08wpEDeAbMO5xi5oLs5HjOwuqMwwysTRywY38/qqZ8dM932q/FmHanM20DyaVHgqjz78xZlgRFsH4i6u0MI1THUmMdQwDPngEmO2h230ij2JNDtabCd8KlgcChTJp2FMpse/1Zu2pu3lpx4fMo1oQntm6fdZvFmnV2eIUXdUoBhwYxT5smC3k5fhpiAdQqaPN5ICk28dwWEnGECdEWOHcAVYvjT2t+dj3WqYWspgWGh6755qnyAUJlIP31DXXC3YiDevTZB/c8BT5vfUL63+Hps0VHsEtojabSwCr2SQRGssEIeQ25kQg==; s=purelymail1; d=purelymail.com; v=1; bh=k8zF43mIns+8zEDRRffV7DY3yvSKsxnAizK8HjEE27Q=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -294462679;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:41:24 +0000 (UTC)
Message-ID: <a11b490c84234b7c37d314e3cfa93434566e221e.camel@sverdlin.org>
Subject: Re: [PATCH 1/6] dt-bindings: opp: h6: Add A133 operating points
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:41:12 +0100
In-Reply-To: <20261104-a133-series-v1-1-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-1-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_144131_794777_1BC28829 
X-CRM114-Status: GOOD (  17.07  )
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

Hi Rajan!

On Wed, 2026-11-04 at 22:40 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> The vendor BSP for the A100/A133 family (sun50iw10) selects the CPU
> speed grade from four efuse fields and the die revision: the speed bin
> (SID offset 0x1c, which also holds the ICPU current), the chip marking
> ID (0x00), a value programmed at production that the BSP calls PCPU
> (0x20) and a bin extension bit (0x28). It knows 11 grades, a0-a6 and
> b0-b3. The A100 operating points describe only three speed bins, taken
> from 0x1c.
>=20
> Add allwinner,sun50i-a133-operating-points for this. In its tables the
> N of opp-microvolt-speedN is the vendor grade: 0-5 are a0-a5 (a6 has
> the same OPPs and voltages as a5) and 6-9 are b0-b3. The four cells are
> named, with the speed bin first. The meaning of the PCPU field is not
> documented; the name follows the vendor BSP.
>=20
> Indices 0-2 are the vendor grades a0-a2, which have the voltages of the
> three A100 speed bins. So allwinner,sun50i-a100-operating-points is a
> valid fallback: software that knows only the A100 compatible reads the
> first cell, selects one of speed0-2 with the A100 rule and gets the
> OPPs and voltages of the A100 table today, with 1008 instead of
> 1080 MHz. That is the A100 selection, not the vendor's; the new
> compatible adds the vendor's. The binding requires indices 0-2 to stay
> usable this way.
>=20
> The new compatible is SoC specific, like the root compatible
> allwinner,sun50i-a133; the A100 compatible stays as it is for existing
> DTBs. The schema now also limits the other compatibles to the single
> unnamed cell that all in-tree users have.
>=20
> Claude Code (Anthropic) drafted this change and its message from the
> vendor BSP sources (field layout and numbers only, no code copied); I
> reviewed it and checked it with dt_binding_check and dtbs_check.
>=20
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Ran dtbs_check on it,

Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0.../opp/allwinner,sun50i-h6-operating-points.yaml=C2=A0 | 94 ++++++=
++++++++++++++--
> =C2=A01 file changed, 86 insertions(+), 8 deletions(-)

