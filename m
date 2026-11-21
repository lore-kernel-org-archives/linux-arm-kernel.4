Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896F606A693
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4D8Dj099;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvT57TFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=; b=4D8Dj099achVDJ
	2goL7dHcQ8towd/jquC5yg2k/POK2bunaPePeXqOwDgOQED1Bu7+TC2JCb1D1H9FIW34LSQ5frZ9j
	mrG8xXD6KA6vRabESM8CPgTa+i8dFYtvtGRWV4isD/FZRymmj9K1dJezV+hI08LocNBcHJHJkybyX
	qC91hTfg/l4kk0VvbA6dDEpPynI80ztIWk4L5Za3nPq3dI7uvq9AmxpMuOv+nl7iOOXaOzTS6VK2k
	agSPpbBTM3xtCS6XpkuxutGmJU3xcoyCzc+xfaXzdlbzIrNXj0F0TNq7mbKShgh6rBb4CoxbZYL4y
	m6GIoB9FUgEOLyoYvO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaW8-0000000Ggl2-11RJ;
	Sat, 21 Nov 2026 02:07:52 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaW5-0000000Ggke-3FpH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 02:07:51 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67db8985419so2113375d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 18:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795226868; cv=none;
        d=google.com; s=arc-20260327;
        b=I8LhuRK8+qhlYDyDNnN1vQ8pJPjz218wPQ3KX1UZkBvMKO1y+6pATGLXW0nsf7LT3z
         jttTRBHTklkTXRy5Wd/AWhANBsUPY1C3ahRaG/r5f99hJ+nZ0SLKGoSPS3ti6c1lJ+3k
         22g6XomthmJloqhceaN+RvPVXEXxzjLLb/f0IkxUAQbZTsW/u3+EhHOj/+Q45R02p/ve
         L8wzkKW0da0oYOPDY0p3j8kQ9JqujE15lmAQRTU8zO6tXxtr0GUEgtPVyEyF/RFLuz05
         nNLr2Rz+aA1NO9thv9B5KL7aXdu4tC83xH+ATpo7Gm2Xj54D2Sr4nx/qBv/PjFGTAWBD
         r5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        fh=ZX2WfpKSUzo83Geg+Xn3YA97SoXM48RGmx/x8WS/4lc=;
        b=DIXbOuuIYbOCnIvk9z/dbYtBSyumabbwgNfLD05P3Dz2zTwVIB7OUeeOGcZoSCChZl
         Cbs3TY+CuC+Peh7JVUEY6iUhhHBYQvTikCHbKw5pqO1WxuqIhyuI+9cCivNFQMfv4FiF
         hZVvm1adzlAy/Di5arh7JDxqN+g2d4bMFGgEP7L1BWO5vOMu5vO9ydRwiBVn2i0Zhkf6
         10wyEfcYF/MDdJy8flkvAQNsWQC6DqK7kmGbCWPrm6P1k8fKLUCCcY1hxgtcN/1Ql73+
         eNj28W4WZ8FqtLOxhUjcjHni1mhB9xSbiz9t6VlcnX7iJWCoy6npmGDmSIvXyor/jAw5
         ozuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226868; x=1795831668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=YvT57TFRgKKg37phJgSKVygUPe3heeWYKT84TSyArvfupK/JaDfK/ksXPw7IBcuBYQ
         Fu82kOQt11sv1z+pV5P+Mn3B1z+5hRZJcGQZBwfEhIHaWc/KeHxzUvwd1MLYZZhz2dof
         vAJPt4Y/xCthPiKqyCTQD9GVM0bKDxE40ocxuCGaw3euGvgeyZmCXFSAxuQM/bjUBvol
         ZylZz+JnzqTOtbI3ngWyXGCuZM8eHydPty5Q+Me3o2xsioQN46QbwH8/xcpK9P+JWSYf
         29xlTBoiQkE4LA+rQAoKYX0i5f10UiJ7s0Xneze3Cz32wy1G348raTloje+Ufre95Wx7
         jkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226868; x=1795831668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=OsItm6arChy/rmBMSQih4jZfnYIuszibmtvJ4KBBjUvA6QpI7qz4O53wRYOdCZM4Zc
         49A84Uiww7lvFRBN3FPLL5KrXhDC7BXMUCU3Hi7dPZrUHHWtWKLfL2ivrzeLQfy2y3/6
         PhaXkOca+P8m0nAM/3MXDuxCloF8onb+46cz87o6VWKmYr7s9wCAH3JnMl/r/pEuX8Rf
         hUu0ZOFS5r+vLjbzKCTof5HGJxObXEaWJWLYtwT/s2Hy6oAFertEIjIsbOevplUevKSD
         H+Qd9P6be2DE0M/GpE3eOq3j3nK1xUglS0cA0HEwDsSNRy6nzK81+W0PCsVmNciCY7wm
         Cb7w==
X-Forwarded-Encrypted: i=1; AL+hErFzwZtGRs2dfd7oxblZIksRwD1exdnF+/rQVvFuDWr/sv+NsFxEGZUIiPqDVR0Fd13Zz/SVEEa+GkEmVbk7nvqA@lists.infradead.org
X-Gm-Message-State: APuU4Z+DNonB3EYiFhXxyUOHrHA+6JJ7Iq84wkW+zKPTOjWbNynkHS24
	n6qwZdLOFnABN8bJElU8Cvf0sPUd30LH/FUuBFy6w7NjwLQEMxsKI5YPTOJEyx7GMBEkEwSOqdZ
	xHCut2jFBzL5+eCViLonhQjO/FfFXHMU=
X-Gm-Gg: AZFdTZeMcYgXR5wnvdOKigNh+ayh6A0HtnK/fOe8SNOCZW2Dbi0fro9EYuTOjQsM7sE
	mRpMR2uFPibuykXuKRCU0ncindcyVE/YcXoyvg+W1kxsBHzPKa9AB1wCW/MpFLKpMGnj7B6GS+p
	aSYwlZqUIGmtBHZGAF6ragHgvRViEO70SkA5AUFMk+MmI/KaFDvTcXSMG95d3R1KFtQNwryA1TD
	+SNRi/909hYpYqi2sHnljHoRpjGu5SxwgXqnrbeKCtVrYeiBJfz/Nzsx28mPMDiCTc7foir5s09
	yzlCzuKf7TjOZoO4olGZahZyEu7Kn3g4kz2na9uEVqjeURIQAwzHDAQQMWQKD3DFEfY5XeT5+En
	CrNpWe/+YhudlQP0JeCKayX/r11LV7n3Dj+PKLim8qVB6TsKHZhQWWJXuYRs=
X-Received: by 2002:a05:690e:438c:b0:67c:2396:3243 with SMTP id
 956f58d0204a3-67df441041dmr1738856d50.29.1795226868649; Fri, 20 Nov 2026
 18:07:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com> <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
 <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
In-Reply-To: <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 21 Nov 2026 07:37:36 +0530
X-Gm-Features: AclHuK-XA1SyrZq1BHyksXey6RIqRcHtTohcQIWXmSS43XQq55hSKSbeB5ss5Rs
Message-ID: <CAMFFDGh9y6JCTJ+Fv+exsDUW=qvkW8Tsi7VfEFTowpT10bJRYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_180749_821767_39E08C0B 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tan,

Thanks for reviewing v2.

I misunderstood the distinction between inline replies and threading a
new revision. I=E2=80=99ll send v3 as a new thread and link the previous
revision in the cover letter.

I=E2=80=99ll rewrite the commit message to explain the hardware behaviour a=
nd
design rationale, and move the test results below ---. I=E2=80=99ll also
include a GitHub link to the design notes as supplementary context.

I=E2=80=99ll address the cleanup structure, naming, register definitions,
shared unlock/relock helpers, error handling, redundant
initialization, readback and copying comments.

Thanks,
Prasanth

