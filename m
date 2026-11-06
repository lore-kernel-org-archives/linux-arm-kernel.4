Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C923E606EE80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLlNYe2b;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=tzD3GYQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UIxBh+zRJVkTKkXW/+Fu4zhs3mLcL4i3tBZ3X/u5LeQ=; b=aLlNYe2bsY33z+
	y61xF/zY3P3nTB+YHJnrPsF2xudcOlH+9Nzc02HKQ+3WQtIqsVojst7y/csuEH4BdDty9/MXFAiJV
	wif21+6N1EQLYFeQnUp8ebJAiW+A9RKZKzhBUFcIHrNvjkhCXE3onqq3pLQWhXBsR+atsnxv2LKgB
	k3xgkYAXVt6P5XpFdx90QKvOTGftr8DvmXSIJw+jaepR8q7nCQagrm3v9fOOk6VBeEI0Vr0mxAJyw
	bbzZJ8J9P/8xIQYKceuMHfxs1ubLt2b+8IBo1QfMtOsp0xT2cylzCf5I+8pBzY7FCNjbOSulbPGkF
	OCZdr4srV1UlMWe4hzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLpx-0000000Coqy-2guP;
	Fri, 06 Nov 2026 15:26:41 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLps-0000000Coo8-3SAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=UIxBh+zRJVkTKkXW/+Fu4zhs3mLcL4i3tBZ3X/u5LeQ=; b=tzD3GYQtC18ZlmPw4JresrP5iA
	USsHZcOQ67Fk1flH3ViDAuTvf6iMLfRizn8Ffr7GgA5yox4JAaAq144RCkadog6YvNkbzzGOv0ycf
	QRl1xxYN3KPMZFEWmxZkQ2fBJuUjCvEx0c5Md9plZZJsMcO6LYfdLqAXulFRcRcdqzjPPTDZ9kCT+
	GTv1CRIQ6OICUjGkXz/qjW2OXyROdqZHGm0oSueyKbf54XQ0tcqQh/NbXGh3leHlbLGZ4Vaf/r9Bu
	OexKkjye9RL5AemAjK1ELaOMaG4tFCUfBRnYRuarzaDxdDafgWq+VlFu9DPLvff9oGuuj/ED7fyWT
	k+4weIXw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPLpq-009NUW-1r;
	Fri, 06 Nov 2026 15:26:34 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 06 Nov 2026 07:21:11 -0800
Subject: [PATCH v2 2/2] btrfs: drain in-flight direct IO before zeroing an
 unaligned EOF block
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-btrfs_page_cache-v2-2-f57575d0071d@debian.org>
References: <20261106-btrfs_page_cache-v2-0-f57575d0071d@debian.org>
In-Reply-To: <20261106-btrfs_page_cache-v2-0-f57575d0071d@debian.org>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: Qu Wenruo <wqu@suse.com>, Filipe Manana <fdmanana@kernel.org>, 
 Boris Burkov <boris@bur.io>, Atish Patra <atish.patra@linux.dev>, 
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com, stable@vger.kernel.org, 
 Qu Wenruo <quwenruo.btrfs@gmx.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=leitao@debian.org;
 h=from:subject:message-id; bh=9VDZR0ipfUyh1vgVGQArt/gpNnJfH39nLr9aJFg2lt4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq7fGdnxAvTzK+p1Ov0ZlWSX5nkQcHKqGIfQtvb
 IPuwJNvogqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCau3xnQAKCRA1o5Of/Hh3
 bVhUEACZMXzKjxEaoHK7ypneRs2+41hPOOfbjZb18sqcHLsVXgUJwV2O+IaUb8QkVmBN4OawZaO
 1qrO+H+ka8yKydmPuLKcRW3+vCq0HUZ061OUidC7uYTyYx0kskZvInA/M089u8WWSV2kosCVDfu
 tYHJldYy7xYWQnqnzDzD03aFqpADshHBy+XZF2vHQ2yk+Ma+FlHRKl5edPE2MHzIrAdJ5UaF/PZ
 PiGNM8XkVrJtSGcfzllq3CVVjrXeFT2TFeT+Oa3y1piD9BBpw8eO78fDaXE+Pkz7Fta1KDDyOAj
 wx9p2xyij2lRQjEVl1h2fcMZtMZKydbo3WXJ1zrgjNCIl+6gq3zhCdQ0hJHWcgOqPbGZS4V1TSG
 6z8NUWD54OGgvEJn1i+0QOaAkRmS4upbxXLL5bAC4MzfUiT+G3O6YY3z5vOe9pYUGCwH2SD7MeF
 aNUB9ZixZarIAmTZrkNC29Bemo9VbdZ2Qsr41Lzi5KZdl7fevryQaroGjMiDrqvGpigCF7zBMrg
 xjde9d4R7FXwHw12iPfzOV6YjrnuUI1ot37ITs3GpKDhrideNXNJGbzTIBwVMqJfeGYSTbKUtZi
 VIVxLdciAk41uATHQLmPgqOxxpbnJXucxXh2djA5EjKqmbc4RWuiuVRsQ2Y85kYN0pSmquEXXum
 pcRkRbP30Kku1IQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_072636_873690_173ABF4F 
X-CRM114-Status: GOOD (  14.44  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A write that starts past an unaligned i_size first zeroes the rest of
the block at i_size: btrfs_write_check() calls btrfs_cont_expand(),
whose btrfs_truncate_block() reads the folio, zeroes it past i_size and
marks that block dirty.

Reading the folio waits for the ordered extents of direct writes to the
other blocks of the folio, but not for their iomap completion, which
runs separately from the ordered extent completion and is where the
page cache gets invalidated:

1) Task A has an async direct write in flight to block 0 of a folio.
2) A fallen back write or a truncate left i_size in the middle of block
   1 of the same folio. Task B issues an O_DIRECT write past i_size, and
   btrfs_truncate_block() waits for the ordered extent of Task A.
3) Task A's write completes and its ordered extent finishes, so Task B
   zeroes the rest of block 1 and dirties the folio. When iomap then
   completes Task A's write, kiocb_invalidate_post_direct_write() finds
   the folio dirty and records -EIO in the mapping, so the next fsync()
   fails.

btrfs_direct_write() calls btrfs_write_check() before it decides to fall
back to buffered IO, so this hits direct writes past EOF as well as the
unaligned ones that fall back: for those, the inode_dio_wait() in
btrfs_buffered_write() runs after the folio is dirty.

Wait for in-flight direct IO before zeroing, as XFS does in
xfs_file_write_zero_eof(). Unlike waiting for the ordered extents,
inode_dio_wait() covers the invalidation, as iomap_dio_complete() calls
inode_dio_end() after it.

Only an unaligned i_size needs the wait, as btrfs_truncate_block()
dirties nothing otherwise. Buffered and encoded writes past such an
i_size wait as well, since they share btrfs_write_check().

A reproducer keeps 4K AIO O_DIRECT writes in flight to the first 15
blocks of a folio of a NOCOW file. Another task truncates the file to
end inside the last block of that folio, then writes past EOF.

On a 64K page VM it got 56 fdatasync() EIOs in 60 seconds before this
patch, 38 when the write past EOF is 512 bytes and falls back, and none
in two runs with this patch.

Qu Wenruo pointed this path out, from a Sashiko review.

Fixes: 95ea0486b20e ("btrfs: allow read-write for 4K sectorsize on 64K page size systems")
Cc: stable@vger.kernel.org
Reported-by: Qu Wenruo <quwenruo.btrfs@gmx.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 fs/btrfs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 2017a96814d857..15802db7b664b8 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1063,6 +1063,13 @@ int btrfs_write_check(struct kiocb *iocb, size_t count)
 		/* Expand hole size to cover write data, preventing empty gap */
 		loff_t end_pos = round_up(pos + count, fs_info->sectorsize);
 
+		/*
+		 * Zeroing the block at an unaligned EOF dirties its folio, so
+		 * drain in-flight direct IO first, see btrfs_buffered_write().
+		 */
+		if (!IS_ALIGNED(oldsize, fs_info->sectorsize))
+			inode_dio_wait(inode);
+
 		ret = btrfs_cont_expand(BTRFS_I(inode), oldsize, end_pos);
 		if (ret)
 			return ret;

-- 
2.53.0-Meta


